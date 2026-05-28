#!/bin/bash
echo "Enter your number:"
read num

count=0

if [ $num -lt 0 ];
then
num=$((-num))
fi
if [ $num -eq 0 ];
then
count=1
else
while [$num -ne 0 ]
do 
num=$((num/10))
count=$((count + 1))
done
fi 
echo "The number of digits is $count."
