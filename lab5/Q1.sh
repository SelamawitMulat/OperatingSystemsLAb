#!/bin/bash
echo "TOP 10 MEMORY CONSUMING PROCESSES"
ps aux --sort=-%mem | head -n 11
echo "BYE"

