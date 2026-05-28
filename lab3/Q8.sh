#!/bin/bash

echo "Enter directory path (leave empty for current directory):"
read dir

if [ -z "$dir" ]; then
    dir="."
fi

if [ ! -d "$dir" ]; then
    echo "Directory does not exist."
    exit 1
fi

for file in "$dir"/*; do
    if [ -f "$file" ]; then
        
        ext="${file##*.}"

        if [ "$file" = "$ext" ]; then
            folder="others"
        else
            folder="$ext"
        fi

        mkdir -p "$dir/$folder"

        cp "$file" "$dir/$folder/"
    fi
done

echo "Files organized successfully!"
