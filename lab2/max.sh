#!/bin/bash
num1=$1
num2=$2
num3=$3
if [ $num1 -ge $num2 ] && [ $num1 -ge $num3 ];then
largest=$num1
elif [ $num2 -ge $num1 ] && [ $num2 -ge $num3 ];then
largest=$num2
else
 largest=$num3
fi
echo " The largest number is $largest."
	

