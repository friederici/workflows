#!/usr/bin/env nextflow

process createFiles {
  input:
  val NUMBER

  output:
  path 'cf_*'

  script:
  """
  echo "Hello ${NUMBER}" > cf_${NUMBER}
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
  echo $filesize
  '''
}

workflow {
  Channel.of(1..10) | createFiles | fileSize
}
