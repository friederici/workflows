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

workflow {
  Channel.of(1..100) | createFiles | view { "File: ${it.name} => ${it.text}" }
}

