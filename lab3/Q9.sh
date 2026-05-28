#!/bin/bash

echo "Enter source directory:"
read src

echo "Enter destination directory:"
read dest

if [ ! -d "$src" ]; then
    echo "Source directory does not exist."
    exit 1
fi

mkdir -p "$dest"

files=("$src"/*)

echo "Files:"
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

echo "Done."
