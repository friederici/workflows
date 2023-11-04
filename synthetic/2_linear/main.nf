#!/usr/bin/env nextflow

/*
 * Workflow: 2_linear
 *
 * This workflow consists of only one task that receives one input file.
 * Dependent on the number of files provided, the task will run that
 * many times. The memory requirement for the task is fixed and 
 * independent of the size it needs to be, so without task scaling, 
 * resources might be unused.
 *
 * The memory consumption of the task, will be the input filesize, but
 * multiplied with 2^20 (i.e. 1 MiB)
 */
 
include { linear_stress } from '../processes.nf'

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30) // in seconds
  
  Channel.fromPath( '/workflows/data/*.txt' ) | combine(cpu) | combine(time) | linear_stress | view
}

