prod-run-default:
	nextflow run main.nf -c base.config -c default.config

prod-run-none:
	nextflow run main.nf -c base.config -c none.config

prod-run-constant:
	nextflow run main.nf -c base.config -c constant.config

prod-run-linear:
	nextflow run main.nf -c base.config -c linear.config

prod-run-combi:
	nextflow run main.nf -c base.config -c combi.config

prod-run-kube:
	nextflow run main.nf -c base.config -c kube.config

dev-run-default:
	nextflow run main.nf -c base.config -c localcws.config -c default.config

dev-run-none:
	nextflow run main.nf -c base.config -c localcws.config -c none.config

dev-run-constant:
	nextflow run main.nf -c base.config -c localcws.config -c constant.config

dev-run-linear:
	nextflow run main.nf -c base.config -c localcws.config -c linear.config

dev-run-combi:
	nextflow run main.nf -c base.config -c localcws.config -c combi.config

dev-run-kube:
	nextflow run main.nf -c base.config -c localcws.config -c kube.config

clean:
	${RM} -r work
	${RM} -r .nextflow*
	${RM} trace*

