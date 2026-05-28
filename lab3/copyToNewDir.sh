#!/bin/bash
echo "Enter directory name"
read dirname
if [[ -n "$dirname" && ! -d "$dirname" ]];
then
mkdir "$dirname"
ls
echo "Enter the file to be copied"
read filename
if [[ -n "$filename" && -f "$filename" ]];
then
cp "$filename" "./$dirname"
else
echo "Invalid filename"
fi
else
echo "Invalid directory name"
fi
