#!/bin/bash
num=1
while [ $num -ne 0 ]
do
echo "Enter your number:"
read num
echo "You entered $num"
done
echo "The program stops because you entered 0."
