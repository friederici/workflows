#!/bin/bash

echo "save traces"
date

for dir in synt*
do
	cd $dir
	pwd

	tar czf ../$dir.tgz TaskScaler_*

	cd ..
done

echo "finished saving traces"
date

