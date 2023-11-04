#!/usr/bin/env nextflow

/*
 * Workflow: 6_compound_square
 * 
 * This workflow consists of 4 tasks.
 * Dependent on the number of files provided, each task will run that
 * many times. The memory requirement for all tasks is fixed and 
 * independent of the size it needs to be, so without task scaling, 
 * resources might be unused.
 *
 * The memory consumption of the first task equals the input size in MB.
 * It creates two output files for the second and third task.
 * The memory consumtion of the second and third task is constant 
 * (independent on the input). Both create output files that are provided to the
 * fourth and last task. The memory consumption of this task is square
 * of the input size.
 *
 */
 
include { constant_stress; constant_stress as constant_stress2; linear_stress; square_stress } from '../processes.nf'

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30) // in seconds

  Channel.fromPath( '/workflows/data/*.txt' ) | combine(cpu) | combine(time) | linear_stress | multiMap { a,b -> 
    upper: a
    lower: b
  } | set { input }
  input.upper | combine(cpu) | combine(time) | constant_stress | set { outa }
  input.lower | combine(cpu) | combine(time) | constant_stress2 | set { outb }
  outa | concat(outb) | buffer( size: 2 ) | combine(cpu) | combine(time) | square_stress | view
}
