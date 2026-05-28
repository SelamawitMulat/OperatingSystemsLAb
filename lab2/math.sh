#!/bin/sh
num1=$1
num2=$2
echo " The numbers are $num1 and $num2."
sum=$((num1 + num2))
prod=$(( num1 * num2))
diff=$((num1 - num2))
echo "The sum of the numbers is $sum."
echo "The product of the numbers is $prod."
echo "The difference of the numbers is $diff."
