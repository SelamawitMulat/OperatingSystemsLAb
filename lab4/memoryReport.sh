#!/bin/bash
echo "Enter filename to store memory info"
read fn
touch $fn
if [ -f $fn ];then 
    echo "$(free -h > $fn)"
fi

