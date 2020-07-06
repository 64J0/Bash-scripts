#!/bin/bash

for counter in $(seq 1 255)
do
	ping -c 1 "10.0.0.$counter"
done
