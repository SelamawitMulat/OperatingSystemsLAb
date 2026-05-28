#!/bin/sh
num1=$1
num2=$2 
num3=$3
sum=$(( num1 + num2 + num3))
avg=$((sum/3))
echo " The average of $num1 ,$num2 and $num3 is $avg."
