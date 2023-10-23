#!/usr/bin/env nextflow

process createFiles {
  input:
  val NUMBER

  output:
  path 'a_*'

  shell:
  '''
  dd if=/dev/zero of=a_!{NUMBER} bs=1M count=2
  '''
}

process memstress1 {
  cpus 1
  memory '2 GB'

  input:
  path 'infile'

  output:
  tuple path('out1'), path('out2')

  shell:
  '''
  filesize=`wc -c < !{infile}`
  stress-ng --vm-bytes ${filesize} --vm-keep -m 1 -t 30
  halfsize=`expr ${filesize} / 2097152`
  dd if=/dev/zero of=out1 bs=1M count=${halfsize}
  dd if=/dev/zero of=out2 bs=1M count=${halfsize}
  '''
}

process memstress2 {
  cpus 1
  memory '1 GB'

  input:
  path 'infile'

  output:
  path 'outfile'

  shell:
  '''
  filesize=`wc -c < !{infile}`
  stress-ng --vm-bytes ${filesize} --vm-keep -m 1 -t 60
  outsize=`expr ${filesize} / 1048576`
  dd if=/dev/zero of=outfile bs=1M count=${outsize}
  '''
}

process memstress3 {
  cpus 1
  memory '1 GB'

  input:
  path 'infile'

  output:
  path 'outfile'

  shell:
  '''
  filesize=`wc -c < !{infile}`
  stress-ng --vm-bytes ${filesize} --vm-keep -m 1 -t 30
  outsize=`expr ${filesize} / 1048576`
  dd if=/dev/zero of=outfile bs=1M count=${outsize}
  '''
}

process memstress4 {
  input:
  tuple path('in1'), path('in2')

  output:
  path 'outfile'

  shell:
  '''
  cat in1 in2 > infile
  filesize=`wc -c < infile`
  stress-ng --vm-bytes ${filesize} --vm-keep -m 1 -t 60
  outsize=`expr ${filesize} / 1048576`
  dd if=/dev/zero of=outfile bs=1M count=${outsize}
  '''
}

workflow {
  Channel.of(1..3) | createFiles | memstress1 | view
}
