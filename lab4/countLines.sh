#!/bin/bash
echo "Enter path of the directory"
read path
ls $path | wc -l
