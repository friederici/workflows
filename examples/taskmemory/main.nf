#!/usr/bin/env nextflow

process sometask {
  debug true
  cpus 1
  memory '4 G'

  input:
  tuple val(NUM), val(MEM), val(CPU), val(TIME)

  script:
  def memory = task.memory
  """
  echo "sometask ${NUM} ${MEM} ${CPU} ${TIME} ${memory}"
  """
}

workflow {
  def cpu = Channel.of(1)
  def time = Channel.of(30) // in seconds
  def mem = Channel.of(500) // in MiB 
  Channel.of(1..3) | combine(mem) | combine(cpu) | combine(time) | sometask
}

