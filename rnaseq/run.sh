#!/bin/bash

for i in $(seq 1 10);
do
	echo $i
	/workflows/requirements/clear_cluster.sh
	/workflows/requirements/apply_cluster.sh

	cd /nfs/data/output
	rm -rf *

	cd /nfs/input/pipelines/rnaseq
	rm -rf work
	rm -rf .nextflow*
	rm Task*

	nextflow run main.nf -config /workflows/config/rnaseq.config -config /workflows/config/wary.config --outdir /nfs/data/output

	zip /workflows/rnaseq/result_rnaseq_$i.zip Task* trace* .nextflow.log*
done
