prod-run-default:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/default.config --outdir /nfs/data/output

prod-run-none:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/none.config --outdir /nfs/data/output

prod-run-constant:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/constant.config --outdir /nfs/data/output

prod-run-linear:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/linear.config --outdir /nfs/data/output

prod-run-combi:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/combi.config --outdir /nfs/data/output

prod-run-kube:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/kube.config --outdir /nfs/data/output

dev-run-default:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/localcws.config -c ../config/default.config --outdir /nfs/data/output

dev-run-none:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/localcws.config -c ../config/none.config --outdir /nfs/data/output

dev-run-constant:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/localcws.config -c ../config/constant.config --outdir /nfs/data/output

dev-run-linear:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/localcws.config -c ../config/linear.config --outdir /nfs/data/output

dev-run-combi:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/localcws.config -c ../config/combi.config --outdir /nfs/data/output

dev-run-kube:
	nextflow run /nfs/input/pipelines/rnaseq/main.nf -c ../config/rnaseq.config -c ../config/localcws.config -c ../config/kube.config --outdir /nfs/data/output

clean:
	${RM} -r work
	${RM} -r .nextflow*
	${RM} trace*

