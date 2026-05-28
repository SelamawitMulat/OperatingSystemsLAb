#!/bin/bash
echo "Enter file name:"
read filename
echo "Number of words: $(wc -w < $filename)"
