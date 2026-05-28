#!/bin/bash
while true
do 
echo "1: Current User"
echo "2: CPU Information"
echo "3: Memory Information"
echo "4:OS Information"
echo "5:Exit"
echo "Choose an option"
read op
if [ $op  -eq 1 ];then
whoami
elif [ $op -eq 2 ];then
lscpu
elif [ $op -eq 3 ];then
free -h
elif [ $op -eq 4 ];then 
uname -a

else
break
fi
done	
echo "Bye Bye Bye"

