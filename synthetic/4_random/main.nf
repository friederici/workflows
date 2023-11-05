#!/usr/bin/env nextflow

/*
 * Workflow: 4_random
 *
 * This workflow consists of only one task that receives one input file.
 * Dependent on the number of files provided, the task will run that
 * many times. The memory requirement for the task is fixed and 
 * independent of the size it needs to be, so without task scaling, 
 * resources might be unused.
 *
 * The memory consumption of the task, will be random between 1 and 4000 MB
 * independent on the input filesize.
 *
 * Because of the (pseudo)-randomness, this workflow will not be
 * reproducible.
 */
 
include { random_stress } from '../processes.nf'

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(10) // in seconds
  
  Channel.fromPath( '/workflows/data/*.txt' ) | combine(cpu) | combine(time) | random_stress | view
}

