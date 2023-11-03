run:
	nextflow run main.nf -c nextflow.config

run-minikube:
	nextflow run main.nf -c nextflow-minikube.config

setup:
	kubectl apply -f basics.yaml
	kubectl apply -f volumes.yaml
	kubectl apply -f scheduler.yaml

clean:
	${RM} -r work
	${RM} -r .nextflow*
	${RM} trace*

