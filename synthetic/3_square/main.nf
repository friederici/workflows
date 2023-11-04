#!/usr/bin/env nextflow

/*
 * Workflow: 3_square
 *
 * This workflow consists of only one task that receives one input file.
 * Dependent on the number of files provided, the task will run that
 * many times. The memory requirement for the task is fixed and 
 * independent of the size it needs to be, so without task scaling, 
 * resources might be unused.
 *
 * The memory consumption of the task, will be square of the input 
 * filesize, but multiplied with 2^20 (i.e. 1 MiB)
 */
 
include { square_stress } from '../processes.nf'

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30) // in seconds
  Channel.fromPath( '/workflows/data/*.wf3' ) | 
    concat(Channel.fromPath( '/workflows/data/*.wf3' )) | 
    buffer( size: 2 ) |
    combine(cpu) | 
    combine(time) |
    square_stress | 
    view
}

