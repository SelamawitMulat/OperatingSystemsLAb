#!/bin/bash
echo "Listing all processes and displaying the first ten"
echo "$(ps aux | head -n 10)"
echo " "
echo "Listing all process, only some columns"
echo "$(ps -eo pid,ppid,%mem,%cpu | head -n 10)"


