#!/bin/bash
echo "Enter Your ID:"
read id
result=$(grep "^$id, " students.txt)

if [ -z "$result" ];then
echo "Student with ID $id is not found."
else
IFS=',' read -r sid name age dept <<< "$result"

echo "Student found!"
echo "ID: $sid"
echo "Name:$name"
echo "Age:$age"
echo "Department: $dept"
fi
