#!/bin/bash
echo "Please enter your fucking grade:"
read grade
if [ $grade -ge 90 ];then
echo "Bravo you got A"
elif [ $grade -ge 75 ] && [ $grade -lt 90 ];then
echo "U got B"
elif [ $grade -ge 50 ] && [ $grade -lt 75 ];then 
echo "U got C"
else
echo "WTF u got F.Such a weirdo person."
fi
