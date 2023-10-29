#!/usr/bin/env nextflow

/*
 * Workflow: synt5
 *
 */
 
process memstress_files {
  debug true
  cpus 1
  memory '4 G'

  input:
  tuple path(IN), val(CPU), val(TIME)

  shell:
  '''
  FILESIZE=`wc -c < !{IN}`
  MEM=`expr ${FILESIZE} + $RANDOM % 500`
  echo "memstress_input !{IN} !{CPU} !{TIME} ${MEM}"
  stress-ng --vm-bytes ${MEM}m --vm-keep -m !{CPU} -t !{TIME}
  '''
}

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30) // in seconds
  
  Channel.fromPath( '/workflows/data/*.txt' ) | combine(cpu) | combine(time) | memstress_files
}

