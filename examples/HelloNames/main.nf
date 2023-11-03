#!/usr/bin/env nextflow

process sayHello {
  input:
  val name

  output:
  stdout

  script:
  """
  echo "Hello ${name}"
  """
}

workflow {
  namesFile = file('names.txt')
  allLines = namesFile.readLines()
  names = []
  for( line : allLines ) {
    names.add(line)
  }
  namesChannel = Channel.fromList( names )

  greetings = sayHello( namesChannel )

  greetingsList = greetings.toList()
  outfile = file('greetings.txt')
  greetingsList.subscribe {
    outfile.append( it )
  }
}

