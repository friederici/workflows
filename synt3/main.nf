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
  stress-ng --vm-bytes ${MEM}m --vm-keep -m 1 -t 20
  halfsize=`expr ${MEM} / 2`
  dd if=/dev/zero of=out1 bs=1 count=${halfsize}
  dd if=/dev/zero of=out2 bs=1 count=${halfsize}
  '''
}

process memstress_files_2 {
  cpus 1
  memory '1 GB'

  input:
  path 'infile'

  output:
  path 'outfile'

  shell:
  '''
  filesize=`wc -c < !{infile}`
  stress-ng --vm-bytes ${filesize}m --vm-keep -m 1 -t 40
  dd if=/dev/zero of=outfile bs=1 count=${filesize}
  '''
}

process memstress_files_3 {
  cpus 1
  memory '1 GB'

  input:
  path 'infile'

  output:
  path 'outfile'

  shell:
  '''
  filesize=`wc -c < !{infile}`
  stress-ng --vm-bytes ${filesize}m --vm-keep -m 1 -t 30
  dd if=/dev/zero of=outfile bs=1 count=${filesize}
  '''
}

process memstress_files_4 {
  cpus 1
  memory '2 GB'

  input:
  tuple path('in1'), path('in2')

  output:
  path 'outfile'

  shell:
  '''
  cat !{in1} !{in2} > infile
  filesize=`wc -c < infile`
  stress-ng --vm-bytes ${filesize}m --vm-keep -m 1 -t 25
  dd if=/dev/zero of=outfile bs=1 count=${filesize}
  '''
}

workflow {
  Channel.fromPath( '/workflows/data/*.txt' ) | memstress_files_1 | multiMap { a,b -> 
    upper: a
    lower: b
  } | set { input }
  input.upper | memstress_files_2 | set { outa }
  input.lower | memstress_files_3 | set { outb }
  outa | concat(outb) | buffer( size: 2 ) | memstress_files_4 | view
}
