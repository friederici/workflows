#!/bin/bash

predictors=(none combi)

echo "starting workflows"
start_date=`date`

for dir in synt*
do
	cd $dir
	pwd
	for p in "${predictors[@]}"
	do
		echo $p
		for i in $(seq 1 5);
		do
			echo $i
			make dev-run-$p
		done
	done
	cd ..
done

end_date=`date`
echo "finished workflows"
echo "from $start_date to $end_date"

