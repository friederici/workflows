#!/usr/bin/env nextflow

process sayHello {
  debug true

  """
  echo "Hello World"
  """
}

workflow {
  sayHello()
}

