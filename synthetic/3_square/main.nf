#!/usr/bin/env nextflow

/*
 * Workflow: 3_square
 *
 * This workflow consists of only one task that receives two input files.
 * Dependent on the number of files provided, the task will run that
 * many times. The memory requirement for the task is fixed and 
 * independent of the size it needs to be, so without task scaling, 
 * resources might be unused.
 *
 * The memory consumption of the task, will be square of 1/100 of the input 
 * filesize, but multiplied with 2^20 (i.e. 1 MiB)
 *
 * The workflow will create the two input files per task as a
 * combination of input files *.txt with themselves.
 */
 
include { square_stress } from '../processes.nf'

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(10) // in seconds

  Channel.fromPath( '/workflows/data/*.txt' )
    .map { x -> new Tuple(x,x) } |
    combine(cpu) | 
    combine(time) |
    square_stress | 
    view
}

