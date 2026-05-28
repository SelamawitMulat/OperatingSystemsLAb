#!/bin/bash
echo "Enter your directory"
read dir
echo "Enter extension(eg. .txt)"
read ext
files=$(ls $dir/*.$ext 2>/dev/null)
if [ -z "$files" ];then
echo "No files found"
else
echo "Files"
echo "$files"
echo "Wanna delete these files?(Y/N)"
read  choice
if [ "$choice" = "Y" ];then
rm $dir/*.$ext
echo "Deleted"
else
echo "Cancelled"
fi 
fi 
