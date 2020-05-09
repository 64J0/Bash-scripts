#!/bin/bash

# Essa variaǘel define como o shell interpreta os números flutuantes.
# Como a minha localização estava setada para o Brasil, então o shell
# interpretava números flutuantes com ",", por isso tive que alterar
# para o padrão norte-americano.
LC_NUMERIC="en_US.UTF-8"

echo -n "Enter the expression: "
read expression

# Wrapping the expression in double parenthesis $((...)) evaluates it,
# but this is confined to integer computations.
# To evaluate expressions involving decimal places (floating points)
# "bc -l" is very useful.
# bc === bash calculations lib

echo -n "Result: "

# Não arredonda / Doesn't rounds correctly
# echo "scale = 4; $expression" | bc

printf "%.3f\n" $(echo "scale = 4; $expression" | bc)

# Aquela cola básica...
# echo "5+5"
# "5+5"
# echo "5+5" | bc
# 10
# echo "5+5" | bc -l
# 10
# echo "5+5.2" | bc -l
# 10.2
# echo "5+5.2" | bc
# 10.2
# echo "3/4" | bc
# 0
# echo "3/4" | bc -l
# .750000000000000000
# echo $((3+3))
# 6
# echo "scale = 2; (10/30)*100" | bc
# 33.00
