#!/bin/bash
dir="mydir"

if [-d"$dir"];
then
echo "The directory already exists."
else
mkdir "$dir"
echo "Directory created."
fi
