#!/bin/bash

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
	echo "** Trapped CTRL-c and finishing the process"
	exit 0
}

for counter in $(seq 1 254)
do
	ping -c 1 "10.0.0.$counter"
done
