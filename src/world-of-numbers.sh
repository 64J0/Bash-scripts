#!/bin/bash
echo -n "Enter the first value: "
read val1
echo -n "Enter the second value: "
read val2
sum=$(($val1+$val2))
sub=$(($val1-$val2))
mul=$(($val1*$val2))
div=$(($val1/$val2))
echo "Result: " $sum, $sub, $mul, $div
