#!/bin/bash
while true
do
echo "Enter ID"
read id

echo "Enter first name"
read fname
echo "Enter father's name"
read father
echo "$id $fname $father $(date)">> Q6.sh
echo "wanna add another?(Y/N)"
read ch
if [ "$ch" != "Y" ];then
break

done

12 hem mulat Wed Mar 25 12:30:54 PM EAT 2026
21 selam teddy Wed Mar 25 12:31:08 PM EAT 2026
