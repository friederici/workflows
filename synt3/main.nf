#!/usr/bin/env nextflow

/*
 * Workflow: synt3
 *
 */
 
process memstress_files_1 {
  debug true
  cpus 1
  memory '2 G'

  input:
  path 'IN'

  output:
  tuple path('out1'), path('out2')

  shell:
  '''
  MEM=`wc -c < !{IN}`
  echo "memstress_files_1 !{IN} ${MEM}"
  stress-ng --vm-bytes ${MEM}m --vm-keep -m 1 -t 30
  halfsize=`expr ${MEM} / 2`
  dd if=/dev/zero of=out1 bs=1 count=${halfsize}
  dd if=/dev/zero of=out2 bs=1 count=${halfsize}
  '''
}

workflow {
  Channel.fromPath( '/workflows/data/*.txt' ) | memstress_files_1 | multiMap { a,b -> 
    upper: a
    lower: b
  } | set { input }
  input.upper | view
  input.lower | view

}

