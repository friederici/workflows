#!/bin/bash

for i in $(seq 1 10);
do
        echo $i
	/workflows/requirements/clear_cluster.sh
	/workflows/requirements/apply_cluster.sh
        make clean-all
        make prod
        ./zip_results.sh
        mv result.zip result_$i.zip
done

