#!/bin/bash
echo "Enter the file to count "
read file 

if [ -f "$file" ];then
word = $(wc -w | < "$file")
lines= $(wc -l | < "$file")
chars= $(wc -c | < "$file")

echo " The words ,lines and characters in $file  are   $word, $lines and $chars  repectively"
else
echo "File Not Found"
fi
