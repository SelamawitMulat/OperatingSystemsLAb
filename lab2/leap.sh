#!/bin/bash
echo "Enter the year:"
read year
if [ $((year%400)) -eq 0 ];then
echo "It's a leap year"
elif [ $((year%100)) -eq 0 ];then
echo "It's not a leap year"
elif [ $((year%4)) -eq 0 ];then
echo "It's a leap year"
else
echo "It's not a leap year"
fi
