#!/bin/bash
echo "enter your first file"
read file1
echo "enter your second file"
read file2
if diff $file1 $file2 >/dev/null;then
echo "Files are the same"
else
echo "Files are different"
fi
