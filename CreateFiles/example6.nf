#!/usr/bin/env nextflow

process createFiles {
  input:
  val NUMBER

  output:
  path 'cf_*'

  script:
  """
  dd if=/dev/zero of=cf_${NUMBER} bs=1M count=1
  """
}

process splitFile {
  input:
  path 'infile'

  output:
  tuple path('out1'), path('out2')

  shell:
  '''
  filesize=`wc -c < !{infile}`
  halfsize=`expr ${filesize} / 2`
  dd if=!{infile} of=out1 bs=1 count=${halfsize}
  dd if=!{infile} of=out2 bs=1 skip=${halfsize}
  '''
}

process joinFile {
  input:
  tuple path('in1'), path('in2')

  output:
  path 'out'

  shell:
  '''
  cat in1 in2 > out
  '''
}

workflow {
  Channel.of(1..10) | createFiles | splitFile | joinFile | view
}
