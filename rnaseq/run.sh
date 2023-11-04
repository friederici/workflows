#!/bin/bash

cd /nfs/input/pipelines/rnaseq
nextflow run main.nf -config /workflows/config/rnaseq.config -config /workflows/config/linear.config --outdir /nfs/data/output

