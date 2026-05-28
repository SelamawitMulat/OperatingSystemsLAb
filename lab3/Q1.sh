#!/bin/bash
echo "Enter your command"
read user_command 
if command -v $user_command>/dev/null 2>&1;then
echo "Executing : $user_command"
$user_command
else
echo "Error: '$user_command' is not valid command "
fi
