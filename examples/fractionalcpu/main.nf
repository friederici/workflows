#!/usr/bin/env nextflow

process sometask {
  debug true
  cpus 0.5
  memory '1 G'

  input:
  tuple val(NUM), val(TIME)

  script:
  def corecount = task.cpus
  """
  echo "sometask ${NUM} ${TIME} ${corecount}"
  sleep ${TIME}
  """
}

workflow {
  def time = Channel.of(30) // in seconds
  Channel.of(1..3) | combine(time) | sometask
}

