#!/bin/bash

for i in $(seq 1 10);
do
	echo $i
	make clean
	make dev-run-none
	zip result_4_random_$i.zip Task* trace* .nextflow.log*
done

