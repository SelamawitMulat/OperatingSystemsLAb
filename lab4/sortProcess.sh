#!/bin/bash
echo "Listing processes in asc order of  PID"
echo "$(ps aux | sort -nk 2)"
echo "#####################################"
echo "Listing processes in dsc order of PID"
echo "$(ps aux | sort -nrk 2)"

