#!/usr/bin/env nextflow

/*
 * Workflow: synt1
 *
 * This workflow consists of only one task that receives no input files.
 * The tasks receives an input channels of values 1 to 10, and therefore
 * runs 10 times. The memory requirement for the task is way higher than
 * it needs to be, so without task scaling, resources will be unused.
 *
 * Each task runs for 30 seconds, when the computer has not enough memory
 * to parallelize the tasks, the makespan will be up to 300 seconds (5
 * minutes). If all tasks can run in parallel, the makespan will be 30
 * seconds.
 *
 */
 
process memstress {
  debug true
  cpus 1
  memory '4 G'

  input:
  tuple val(NUM), val(MEM), val(CPU), val(TIME)

  script:
  """
  echo "memstress ${NUM}"
  stress-ng --vm-bytes ${MEM}m --vm-keep -m ${CPU} -t ${TIME}
  """
}

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30) // in seconds
  def mem = Channel.of(500) // in MiB 
  Channel.of(1..10) | combine(mem) | combine(cpu) | combine(time) | memstress
}

