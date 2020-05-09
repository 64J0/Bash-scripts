#!/bin/bash
# Especifica onde o código será executado

# A flag -n no comando echo impede que quebre a linha depois da execução do comando
echo -n "Lado 1: "
read L1

echo -n "Lado 2: "
read L2

echo -n "Lado 3: "
read L3

# Constraints
if [ $L1 -lt 1 -o $L1 -gt 1000 -o $L2 -lt 1 -o $L2 -gt 1000  -o $L3 -lt 1 -o $L3 -gt 1000 ]
then
	echo "Conditions not satisfied"
	exit 1
fi

if [ $((L1 + L2)) -lt $L3 -o $((L1 + L3)) -lt $L2 -o $((L2 + L3)) -lt $L1 ]
then
	echo "Conditions not satisfied"
	exit 1
fi

# -a === &&
# -o === ||
# Para acessar mais flags => man test
if [ "$L1" = "$L2" -a "$L1"  = "$L3" ]
then
	echo "EQUILATERAL"
elif [ "$L1" != "$L2" -a "$L1" != "$L3" ]
then
	echo "SCALENE"
else
	echo "ISOSCELES"
fi
