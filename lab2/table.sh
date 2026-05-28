#!/bin/bash
echo "Enter your number:"
read num
for i in {1..12}
do 
prod=$((num * i))
echo "$num * $i = $prod"
done
