#!/usr/bin/env nextflow

/*
 * Workflow: synt6
 *
 * No Requests set
 *
 */
 
process memstress {
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

