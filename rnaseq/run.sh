#!/bin/bash

cd /nfs/data/output
rm -rf *

cd /nfs/input/pipelines/rnaseq
rm -rf work
rm -rf .nextflow*
rm Task*

nextflow run main.nf -config /workflows/config/rnaseq.config -config /workflows/config/wary.config --outdir /nfs/data/output

