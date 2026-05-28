#!/bin/bash
echo "Enter your directory"
read dir

echo "Enter your extension"
read ext
if [ !d "$dir" ];then 
echo " The director doesnt exist"
exit 1
fi
total_files=$(find "$dir" -type f |wc -l)

ext_files=$(find "$dir" -type f -name "*.$ext" | wc -l)

echo " Total files in the directory $dir are $total_files"
echo " Total files with extension $ext in the directory $dir are $ext_files."
