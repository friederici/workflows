#!/usr/bin/env nextflow

/*
 * Workflow: synt2
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
 
process memstress_files {
  debug true
  cpus 1
  memory '4 G'

  input:
  tuple path(IN), val(CPU), val(TIME)

  shell:
  '''
  MEM=`wc -c < !{IN}`
  echo "memstress_input !{IN} !{CPU} !{TIME} ${MEM}"
  stress-ng --vm-bytes ${MEM}m --vm-keep -m !{CPU} -t !{TIME}
  '''
}

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30) // in seconds
  
  Channel.fromPath( '/workflows/data/*.txt' ) | combine(cpu) | combine(time) | memstress_files
}

