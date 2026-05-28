#!/bin/bash
echo"Enter path of the directory"
read path 
echo "Total files: $(ls -1 $path | wc -l)"
echo "Bash files: $( ls $path | grep  '\.sh' | wc -l)"
