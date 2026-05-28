#!/bin/bash
num=$1
var=$(( num%2))
if [ $var -eq 0 ];then 
echo "The number is even."
else 
echo "The number is odd."
fi
