#!/usr/bin/env nextflow

process mayfail {
  debug true
  cpus 1
  memory '4 G'
  errorStrategy 'retry'
  maxRetries 10

  input:
  path IN

  shell:
  '''
  echo "hello !{IN}"
  FAIL=$(( $RANDOM % 2 ))
  echo $FAIL
  if (( $FAIL > 0 ))
    then
      echo "fail"
      exit 137
    else
      echo "succ"
      exit 0
  fi
  '''
}

workflow {
  Channel.fromPath( '/workflows/data/*.wf3' ) | mayfail
}

