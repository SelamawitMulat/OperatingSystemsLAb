#!/bin/bash

# =====================================================
# SYSTEM CALL ANALYZER SHELL (USING STRACE)
# =====================================================

echo "=============================================="
echo "   SYSTEM CALL ANALYZER SHELL"
echo "   (Type 'exit' to quit)"
echo "=============================================="

# -----------------------------------------------------
# Function: Explain system calls
# -----------------------------------------------------
explain_syscall() {
    case $1 in
        open|openat)
            echo "Description: Opens a file or directory"
            ;;
        read)
            echo "Description: Reads data from a file descriptor"
            ;;
        write)
            echo "Description: Writes data to a file descriptor"
            ;;
        close)
            echo "Description: Closes a file descriptor"
            ;;
        execve)
            echo "Description: Executes a program (loads new process)"
            ;;
        fork|clone)
            echo "Description: Creates a new process or thread"
            ;;
        mmap)
            echo "Description: Maps files or devices into memory"
            ;;
        access)
            echo "Description: Checks file permissions"
            ;;
        stat|fstat)
            echo "Description: Gets file metadata (size, permissions, etc.)"
            ;;
        lseek)
            echo "Description: Moves file pointer position"
            ;;
        exit|exit_group)
            echo "Description: Terminates a process"
            ;;
        *)
            echo "Description: System call used by the operating system kernel"
            ;;
    esac
}

# -----------------------------------------------------
# Main Shell Loop
# -----------------------------------------------------
while true; do

    echo -n "myShell> "
    read cmd

    # Exit condition
    if [ "$cmd" == "exit" ]; then
        echo "Exiting System Call Analyzer Shell..."
        break
    fi

    # Ignore empty input
    if [ -z "$cmd" ]; then
        continue
    fi

    echo ""
    echo "=============================================="
    echo "Executing: $cmd"
    echo "Capturing system calls using strace..."
    echo "=============================================="
    echo ""

    # Run command with strace (stderr contains syscalls)
    output=$(strace -f $cmd 2>&1)

    count=0

    # Read each line of strace output
    while read -r line; do

        # Filter syscall lines
        if [[ "$line" == *"("* && "$line" == *"="* ]]; then

            syscall=$(echo "$line" | cut -d'(' -f1 | xargs)
            params=$(echo "$line" | sed -n 's/.*(\(.*\)).*/\1/p')
            retval=$(echo "$line" | awk -F '=' '{print $2}' | xargs)

            echo "--------------------------------------"
            echo "System Call : $syscall"
            explain_syscall $syscall
            echo "Parameters  : $params"
            echo "Return Value: $retval"
            echo "--------------------------------------"
            echo ""

            count=$((count+1))

            # limit output for readability
            if [ $count -ge 15 ]; then
                break
            fi
        fi

    done <<< "$output"

done
