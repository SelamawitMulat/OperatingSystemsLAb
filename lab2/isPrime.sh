#!/bin/bash
echo "Enter your number :"
read num
i=2
isPrime=1
if [$num -le 1 ];
then
isPrime=0
else
while [$i -lt $num ]
do 
if [ $((num % i)) -eq 0 ];
then 
isPrime=0
break
fi
 i=$((i+1))
done
fi

if [ $isPrime -eq 1 ];
then 
echo "$num is a prime number"
else
echo "$num is not a prime number"
fi
