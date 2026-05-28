#!/bin/bash
echo "Creating sleeping processes"
sleep 10 & 
sleep 15 &
echo "List ao all processes"
ps
echo "Waiting for processes to complete"
wait 
echo "All process completed"

