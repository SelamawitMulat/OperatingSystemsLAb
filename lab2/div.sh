#!/bin/bash
num1=$1
var3=$((num1 % 3))
var5=$((num1 % 5))
if [ $var3 -eq 0 ] && [ $var5 -eq 0 ];then 
echo "The number is divisible by 3 and 5"
else 
echo "It is not divisible by 3 and 5"
fi

