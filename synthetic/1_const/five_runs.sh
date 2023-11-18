#!/bin/bash

for i in $(seq 1 5);
do
	echo $i
	make clean
	make dev-run-none
	zip result_none_$i.zip Task* trace* .nextflow.log*
done

for i in $(seq 1 5);
do
	echo $i
	make clean
	make dev-run-constant
	zip result_constant_$i.zip Task* trace* .nextflow.log*
done

for i in $(seq 1 5);
do
	echo $i
	make clean
	make dev-run-linear
	zip result_linear_$i.zip Task* trace* .nextflow.log*
done

for i in $(seq 1 5);
do
	echo $i
	make clean
	make dev-run-combi
	zip result_combi_$i.zip Task* trace* .nextflow.log*
done

for i in $(seq 1 5);
do
	echo $i
	make clean
	make dev-run-wary
	zip result_wary_$i.zip Task* trace* .nextflow.log*
done

