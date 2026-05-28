#!/bin/bash
echo "Enter the file name"
read filename
if [ -f $filename ];
then
echo  "########## $filename ##########"
cat $filename
echo "####################"
else
echo "Sorry ,no such file"
fi
