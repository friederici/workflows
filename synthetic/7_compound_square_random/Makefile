prod-run-without:
	nextflow run main.nf -c ../../config/base.config

prod-run-default:
	nextflow run main.nf -c ../../config/base.config -c ../../config/default.config

prod-run-none:
	nextflow run main.nf -c ../../config/base.config -c ../../config/none.config

prod-run-constant:
	nextflow run main.nf -c ../../config/base.config -c ../../config/constant.config

prod-run-linear:
	nextflow run main.nf -c ../../config/base.config -c ../../config/linear.config

prod-run-combi:
	nextflow run main.nf -c ../../config/base.config -c ../../config/combi.config

prod-run-wary:
	nextflow run main.nf -c ../../config/base.config -c ../../config/wary.config

dev-run-without:
	nextflow run main.nf -c ../../config/base.config -c ../../config/localcws.config

dev-run-default:
	nextflow run main.nf -c ../../config/base.config -c ../../config/localcws.config -c ../../config/default.config

dev-run-none:
	nextflow run main.nf -c ../../config/base.config -c ../../config/localcws.config -c ../../config/none.config

dev-run-constant:
	nextflow run main.nf -c ../../config/base.config -c ../../config/localcws.config -c ../../config/constant.config

dev-run-linear:
	nextflow run main.nf -c ../../config/base.config -c ../../config/localcws.config -c ../../config/linear.config

dev-run-combi:
	nextflow run main.nf -c ../../config/base.config -c ../../config/localcws.config -c ../../config/combi.config

dev-run-wary:
	nextflow run main.nf -c ../../config/base.config -c ../../config/localcws.config -c ../../config/wary.config

clean:
	${RM} -r work
	${RM} -r .nextflow*
	${RM} trace*
	${RM} Task*

