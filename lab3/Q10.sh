#!/bin/bash

show_menu() {
    echo "-----------------------------------------"
    echo " File Management Utility Commands:"
    echo " 1. create_file      - Create a new file"
    echo " 2. create_dir       - Create a new directory"
    echo " 3. copy_file        - Copy files from one directory to another"
    echo " 4. move_file        - Move files from one location to another"
    echo " 5. rename_file      - Rename a file"
    echo " 6. delete_file      - Delete a file"
    echo " 7. list_commands    - Show this menu"
    echo " 8. exit             - Exit the utility"
    echo "-----------------------------------------"
}

create_file() {
    echo "Enter filename to create:"
    read file
    touch "$file"
    echo "File '$file' created."
}

create_dir() {
    echo "Enter directory name to create:"
    read dir
    mkdir -p "$dir"
    echo "Directory '$dir' created."
}

copy_file() {
    echo "Enter source directory:"
    read src
    echo "Enter destination directory:"
    read dest
    mkdir -p "$dest"
    files=("$src"/*)
    echo "Files in $src:"
    for i in "${!files[@]}"; do
        echo "$((i+1)). $(basename "${files[$i]}")"
    done
    echo "Enter file numbers to copy (space-separated):"
    read nums
    for n in $nums; do
        idx=$((n-1))
        if [ -f "${files[$idx]}" ]; then
            cp "${files[$idx]}" "$dest/"
        else
            echo "Invalid choice: $n"
        fi
    done
    echo "Selected files copied."
}

move_file() {
    echo "Enter source directory:"
    read src
    echo "Enter destination directory:"
    read dest
    mkdir -p "$dest"
    files=("$src"/*)
    echo "Files in $src:"
    for i in "${!files[@]}"; do
        echo "$((i+1)). $(basename "${files[$i]}")"
    done
    echo "Enter file numbers to move (space-separated):"
    read nums
    for n in $nums; do
        idx=$((n-1))
        if [ -f "${files[$idx]}" ]; then
            mv "${files[$idx]}" "$dest/"
        else
            echo "Invalid choice: $n"
        fi
    done
    echo "Selected files moved."
}

rename_file() {
    echo "Enter file to rename:"
    read file
    if [ ! -f "$file" ]; then
        echo "File does not exist."
        return
    fi
    echo "Enter new filename:"
    read newfile
    mv "$file" "$newfile"
    echo "File renamed to '$newfile'."
}

delete_file() {
    echo "Enter file to delete:"
    read file
    if [ ! -f "$file" ]; then
        echo "File does not exist."
        return
    fi
    rm "$file"
    echo "File '$file' deleted."
}

while true; do
    echo ""
    echo "Enter command (list_commands to show menu):"
    read cmd
    case $cmd in
        create_file) create_file ;;
        create_dir) create_dir ;;
        copy_file) copy_file ;;
        move_file) move_file ;;
        rename_file) rename_file ;;
        delete_file) delete_file ;;
        list_commands) show_menu ;;
        exit) echo "Exiting utility."; break ;;
        *) echo "Invalid command. Type 'list_commands' to see options." ;;
    esac
done
