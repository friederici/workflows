#!/usr/bin/env nextflow

process createFiles {
  input:
  val NUMBER

  output:
  path 'cf_*'

  script:
  """
  dd if=/dev/zero of=cf_${NUMBER} bs=1M count=20
  """
}

process fileSize {
  input:
  path 'infile'

  output:
  stdout

  shell:
  '''
  filesize=`wc -c < !{infile}`
  echo -n $filesize
  '''
}

process memstress {
  input:
  tuple val(MEM), val(CPU), val(TIME)

  script:
  """
  stress-ng --vm-bytes ${MEM}m --vm-keep -m ${CPU} -t ${TIME}
  """
}

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30)
  Channel.of(1..10) | createFiles | fileSize | combine(cpu) | combine(time) | memstress
}
