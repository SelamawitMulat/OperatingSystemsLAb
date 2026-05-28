#!/bin/bash
echo "Processes sorted by memory percentage(%mem):"
ps  -eo %mem | sort

