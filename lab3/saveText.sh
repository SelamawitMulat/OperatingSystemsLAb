#!/bin/bash
echo "Enter filename"
read filename
if [ -n "$filename" ];
then
touch $filename
echo "Write some text and press enter"
read content
echo "$content">>$filename
echo "Successfully saved."
else
echo "Invalid filename"
fi
