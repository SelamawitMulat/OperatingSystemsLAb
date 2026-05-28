#!/bin/bash
echo "TOP 10 CPU CONSUMING PROCESSES"
ps aux --sort=-%cpu | head -n 11

echo "BYE"

