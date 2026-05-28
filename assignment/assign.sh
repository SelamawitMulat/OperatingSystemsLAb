#!/bin/bash

echo "=============================================="
echo "   SYSTEM CALL ANALYZER SHELL"
echo "   Type  Any command you want to trace"
echo "   (Type 'exit' to quit)"
echo "=============================================="

# ------------------------------------------------
# System call description + purpose
# ------------------------------------------------
explain_syscall() {
    case $1 in
        open)
            echo "Description: Opens a file and returns a file descriptor"
            echo "Purpose    : Used to access files for reading or writing"
            ;;
        openat)
            echo "Description: Opens a file relative to a directory"
            echo "Purpose    : Safer file opening using directory reference"
            ;;
        read)
            echo "Description: Reads data from a file descriptor"
            echo "Purpose    : Retrieves data from files or input streams"
            ;;
        write)
            echo "Description: Writes data to a file descriptor"
            echo "Purpose    : Sends data to files or output devices"
            ;;
        close)
            echo "Description: Closes a file descriptor"
            echo "Purpose    : Releases system resources used by a file"
            ;;
        execve)
            echo "Description: Executes a program and replaces current process"
            echo "Purpose    : Runs external programs inside the system"
            ;;
        fork)
            echo "Description: Creates a new process"
            echo "Purpose    : Enables multitasking by duplicating process"
            ;;
        clone)
            echo "Description: Creates a process or thread"
            echo "Purpose    : Used for lightweight process/thread creation"
            ;;
        mmap)
            echo "Description: Maps files or devices into memory"
            echo "Purpose    : Provides efficient file/memory access"
            ;;
        access)
            echo "Description: Checks file permissions"
            echo "Purpose    : Verifies if a file can be accessed"
            ;;
        stat)
            echo "Description: Gets file metadata using file path"
            echo "Purpose    : Retrieves file information like size and permissions"
            ;;
        fstat)
            echo "Description: Gets file metadata using file descriptor"
            echo "Purpose    : Retrieves info of already opened file"
            ;;
        lseek)
            echo "Description: Moves file pointer position"
            echo "Purpose    : Controls where reading/writing happens in file"
            ;;
        exit|exit_group)
            echo "Description: Terminates a process"
            echo "Purpose    : Ends program execution"
            ;;
        *)
            echo "Description: System call used by kernel"
            echo "Purpose    : Low-level operating system operation"
            ;;
    esac
}

# ------------------------------------------------
# Parameter breakdown (DETAILED VERSION)
# ------------------------------------------------
explain_params() {
    syscall=$1
    params=$2

    echo "Parameter Breakdown:"

    IFS=',' read -ra arr <<< "$params"

    i=0
    for p in "${arr[@]}"; do
        p=$(echo "$p" | xargs)

        case $syscall in

            open|openat)
                case $i in
                    0)
                        echo " - param1: $p → directory reference (AT_FDCWD means current process directory)"
                        ;;
                    1)
                        echo " - param2: $p → file path the system is trying to open"
                        ;;
                    2)
                        echo " - param3: $p → access mode/flags controlling read/write/exec permissions"
                        ;;
                esac
                ;;

            read)
                case $i in
                    0)
                        echo " - fd: $p → file descriptor identifying the file to read from"
                        ;;
                    1)
                        echo " - buffer: $p → memory location where data will be stored"
                        ;;
                    2)
                        echo " - size: $p → number of bytes requested to read"
                        ;;
                esac
                ;;

            write)
                case $i in
                    0)
                        echo " - fd: $p → file descriptor to write into"
                        ;;
                    1)
                        echo " - buffer: $p → data stored in memory to be written"
                        ;;
                    2)
                        echo " - size: $p → number of bytes written"
                        ;;
                esac
                ;;

            execve)
                case $i in
                    0)
                        echo " - program: $p → executable file being executed"
                        ;;
                    1)
                        echo " - argv: $p → arguments passed to the program"
                        ;;
                    2)
                        echo " - envp: $p → environment variables passed to program"
                        ;;
                esac
                ;;

            mmap)
                case $i in
                    0)
                        echo " - addr: $p → starting memory address (NULL means OS chooses automatically)"
                        ;;
                    1)
                        echo " - length: $p → size of memory region allocated"
                        ;;
                    2)
                        echo " - protection: $p → memory permissions (read/write/execute)"
                        ;;
                    3)
                        echo " - flags: $p → mapping behavior (shared/private/anonymous)"
                        ;;
                    4)
                        echo " - fd: $p → file descriptor (-1 means no file backing)"
                        ;;
                    5)
                        echo " - offset: $p → starting point in file"
                        ;;
                esac
                ;;

            stat|fstat)
                echo " - param$((i+1)): $p → file metadata input used by kernel"
                ;;

            lseek)
                case $i in
                    0)
                        echo " - fd: $p → file descriptor"
                        ;;
                    1)
                        echo " - offset: $p → position to move file pointer"
                        ;;
                    2)
                        echo " - whence: $p → reference point (start/current/end)"
                        ;;
                esac
                ;;

            *)
                echo " - param$((i+1)): $p → raw system value used by kernel"
                ;;
        esac

        i=$((i+1))
    done
}

# ------------------------------------------------
# Return value interpretation
# ------------------------------------------------
interpret_return() {
    retval=$1

    if [[ "$retval" == "-1"* ]]; then
        echo "Interpretation: ERROR (system call failed)"
    else
        echo "Interpretation: SUCCESS"
    fi
}

# ------------------------------------------------
# System calls to analyze
# ------------------------------------------------
important_calls="open openat read write close execve fork clone mmap access stat fstat lseek exit exit_group"

# ------------------------------------------------
# MAIN LOOP
# ------------------------------------------------
while true; do

    echo -n "ourShell> "
    read cmd

    if [ "$cmd" == "exit" ]; then
        echo "Exiting System Call Analyzer Shell..."
        break
    fi

    if [ -z "$cmd" ]; then
        continue
    fi

    echo ""
    echo "=============================================="
    echo "Executing: $cmd"
    echo "=============================================="
    echo ""

    output=$(strace -f $cmd 2>&1)

    count=0

    while read -r line; do

        syscall=$(echo "$line" | cut -d'(' -f1 | xargs)

        for call in $important_calls; do
            if [[ "$syscall" == "$call" ]]; then

                params=$(echo "$line" | sed -n 's/.*(\(.*\)).*/\1/p')
                retval=$(echo "$line" | awk -F '= ' '{print $2}')

                echo "--------------------------------------"
                echo "System Call : $syscall"

                explain_syscall "$syscall"

                echo "Parameters  : $params"
                explain_params "$syscall" "$params"

                echo "Return Value: $retval"
                interpret_return "$retval"

                echo "--------------------------------------"
                echo ""

                count=$((count+1))

                if [ $count -ge 15 ]; then
                    break 2
                fi
            fi
        done

    done <<< "$output"

    echo "============= SUMMARY ============="
    for call in $important_calls; do
        c=$(echo "$output" | grep -c "^$call")
        if [ $c -gt 0 ]; then
            echo "$call → $c times"
        fi
    done
    echo "=================================="
    echo ""

done
