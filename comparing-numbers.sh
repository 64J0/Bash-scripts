#!/bin/bash
# For POSIX shells that don't support (()), you can use -lt, -gt, -eq

echo -n "Entre com o primeiro valor: "
read x
echo -n "Entre com o segundo valor: "
read y

if [ "$x" -eq "$y" ]
then
	echo "$x is equal to $y"
elif (( x > y ))
then
	echo "$x is greater than $y"
elif [ "$x" -lt "$y" ]
then
	echo "$x is less than $y"
fi
