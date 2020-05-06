#!/bin/bash
# Nesse script serão mostradas duas abordagens para executar um loop
# for com um script bash
# Anotação: \n não funcionou na string.

echo "Bash version ${BASH_VERSION}..."
echo "Bash v4.0+ has inbuilt support for setting up a step value using"
echo "{START..END..INCREMENT} syntax"

for i in {1..99..2}
do
	echo "$i";
done

# Mostra apenas os valores ímpares de 1 até 100
for (( i=1; i<=99; i=i+2 ))
do
	echo "$i";
done

