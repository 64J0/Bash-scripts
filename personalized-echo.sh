#!/bin/bash
# Write a bash script which accepts name as input and displays a greeting: 
# "Welcome (name)"

# name will be the variable's name
# -n tells the echo to don't break the line
echo -n "Please, enter a name: "
read name

echo "Welcome $name"
