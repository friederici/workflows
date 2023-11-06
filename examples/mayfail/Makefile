
run:
	NXF_DEBUG=3 nextflow run main.nf

run-cws:
	NXF_DEBUG=3 nextflow run main.nf -c base.config -c localcws.config

clean:
	${RM} -r work
	${RM} -r .nextflow*
	${RM} trace*
	${RM} Task*

