#!/bin/bash

echo "starting workflows"
date

for dir in synt*
do
	cd $dir
	pwd

	for i in $(seq 1 10);
	do
		echo $i
		make run
	done

	cd ..
done

echo "finished workflows"
date

