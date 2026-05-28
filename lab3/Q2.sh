#!/bin/bash
echo "Enter your commands separated by space"
read commands
for cmd in $commands
do 
if command -v "$cmd" > /dev/null 2>&1;then
echo "Describing  the command"
 whatis "$cmd"
else  
echo "not valid command"
fi
done
