#!/usr/bin/env nextflow

/*
 * Workflow: 1_const
 *
 * This workflow consists of only one task that receives one input file.
 * Dependent on the number of files provided, the task will run that
 * many times. The memory requirement for the task is fixed and 
 * independent of the size it needs to be, so without task scaling, 
 * resources might be unused.
 *
 * The memory consumption of the task, will be constant 500MB, 
 * independent on the input given.
 */

include { constant_stress } from '../processes.nf'

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30) // in seconds
  
  Channel.fromPath( '/workflows/data/*.txt' ) | combine(cpu) | combine(time) | constant_stress | view
}
