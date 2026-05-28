#!/bin/bash
echo " Enter the file name:"
read filename
if [ -f $filename ];
then
words=$(wc -w < $filename)
chars=$(wc -m < $filename)
bytes=$(wc -c < $filename)
echo "### $filename ###"
    echo "Words=$words"
    echo "Chars=$chars"
    echo "Bytes=$bytes"
echo "##########"
else
echo "Sorry.no such file"
fi
