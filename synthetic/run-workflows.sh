#!/bin/bash

if (( $# == 0 ))
then
	prefix="prod"
else
	prefix="dev"
fi

predictors=(none combi)

echo "starting workflows for $prefix"
start_date=`date`

for dir in *
do
	cd $dir
	pwd
	for p in "${predictors[@]}"
	do
		echo $p
		for i in $(seq 1 5);
		do
			echo $i
			make $prefix-run-$p
		done
	done
	cd ..
done

end_date=`date`
echo "finished workflows"
echo "from $start_date to $end_date"

