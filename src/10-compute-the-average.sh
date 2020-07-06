#!/bin/bash
# ^ shebang ou hashbang. Ela indica que intérprete será usado para analisar
# o resto do script. Em suma, é o que torna esse um script bash.

# Given N integers, compute their average correct to three decimal places.

echo -n "Diga quantos números serão usados: "
read N

# Verifica se o valor existe e é vazio
if [ -z $N ]
then
	echo "Valor vazio"
	exit -1
fi

# Usando uma determinada sintaxe do if
if (( 1 > $N || $N > 500 ))
then
	echo "Quantidade inválida"
	exit -1
fi

# Usando outra sintaxe do if:
if [ 1 -gt $N ] || [ $N -gt 500 ]
then
	echo "Quantidade inválida"
fi

for (( count=1; count <= $N; count++ ))
do
	echo -n "Entre com o valor $count: "
	read x$count # Precisa ler um array

	echo "Valor cadastrado: $( x$count )"
done
