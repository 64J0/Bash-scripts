#!/bin/bash
echo -n "Qual será a sua escolha? (y/n) "

read escolha

if [ "$escolha" = "N" ] || [ "$escolha" = "n" ]
then
	echo "NO"
elif [ "$escolha" = "Y" ] || [ "$escolha" = 'y' ]
then
	echo "YES"
fi
