#!/bin/bash
echo "Enter your number:"
read num
i=1
while [ $i -le $num ]
do 
echo $i
i=$((i + 1))
done 
