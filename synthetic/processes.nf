#!/usr/bin/env nextflow

/*
 * This module contains all the processes used in the synthetic workflows
 */

process constant_stress {
  cpus 0.5
  memory { 6.GB * task.attempt }
  errorStrategy 'retry'
  maxRetries 5

  input:
  tuple path(IN), val(CPU), val(TIME)

  output:
  path 'OUT'

  shell:
  '''
  FILESIZE=`wc -c < !{IN}`
  MEM=500
  echo "constant_stress !{IN} !{CPU} !{TIME} ${MEM}"
  #stress-ng --vm-bytes ${MEM}m --vm-keep -m !{CPU} -t !{TIME} --page-in
  /a.out $(( $MEM * 1024 * 1024 )) !{TIME}
  dd if=/dev/zero of=OUT bs=1 count=${FILESIZE}
  '''
}

process linear_stress {
  cpus 0.5
  memory { 6.GB * task.attempt }
  errorStrategy 'retry'
  maxRetries 5

  input:
  tuple path(IN), val(CPU), val(TIME)

  output:
  tuple path('OUT1'), path('OUT2')

  shell:
  '''
  FILESIZE=`wc -c < !{IN}`
  MEM=`expr ${FILESIZE}`
  echo "linear_stress !{IN} !{CPU} !{TIME} ${MEM}"
  #stress-ng --vm-bytes ${MEM}m --vm-keep -m !{CPU} -t !{TIME} --page-in
  /a.out $(( $MEM * 1024 * 1024 )) !{TIME}
  halfsize=`expr ${MEM} / 2`
  dd if=/dev/zero of=OUT1 bs=1 count=${halfsize}
  dd if=/dev/zero of=OUT2 bs=1 count=${halfsize}
  '''
}

process square_stress {
  cpus 0.5
  memory { 6.GB * task.attempt }
  errorStrategy 'retry'
  maxRetries 10

  input:
  tuple path('IN1'), path('IN2'), val(CPU), val(TIME)

  output:
  path 'OUT'

  shell:
  '''
  cat !{IN1} !{IN2} > IN
  FILESIZE=`wc -c < IN`
  MEM=$(( (${FILESIZE}/100) ** 2 ))
  echo "square_stress !{IN1} !{IN2} !{CPU} !{TIME} ${MEM}"
  #stress-ng --vm-bytes ${MEM}m --vm-keep -m !{CPU} -t !{TIME} --page-in
  /a.out $(( $MEM * 1024 * 1024 )) !{TIME}
  dd if=/dev/zero of=OUT bs=1 count=${MEM}
  '''
}

process random_stress {
  cpus 0.5
  memory { 6.GB * task.attempt }
  errorStrategy 'retry'
  maxRetries 5

  input:
  tuple path(IN), val(CPU), val(TIME)

  output:
  path 'OUT'

  shell:
  '''
  FILESIZE=`wc -c < !{IN}`
  MEM=`expr 1 + $RANDOM % 4000`
  echo "random_stress !{IN} !{CPU} !{TIME} ${MEM}"
  #stress-ng --vm-bytes ${MEM}m --vm-keep -m !{CPU} -t !{TIME} --page-in
  /a.out $(( $MEM * 1024 * 1024 )) !{TIME}
  dd if=/dev/zero of=OUT bs=1 count=${FILESIZE}
  '''
}
