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

process collectFiles {
  input:
  path 'in'

  script:
  """
  echo "${in}"
  """
}

workflow {
  Channel.of(1..10) | createFiles | collect | collectFiles
}

