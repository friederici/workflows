#!/usr/bin/env nextflow
 
process memstress {
  debug true
  cpus 1
  memory '4 G'
  pod = [ [env: 'env_memory', value: '500'], [env: 'env_time', value: '30'], [env: 'env_cores', value: '1'] ]

  input:
    val STR

  """
  echo "memstress !{STR}"
  /mem.sh
  """
}

workflow {
  Channel.of(1..10) | memstress
}

