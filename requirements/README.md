# requirements

Things required to set up in the Kubernetes cluster for the synt* workflows.

## development environment

There are two scripts that help in starting a minikube cluster and applying the neccessary pods:

    end_minikube.sh

    run_minikube.sh

Start CWS in your IDE in parallel.


## production environemnt

It is expected that the cluster is already up and running and kubectl is working.

Just run `apply_cluster.sh` to configure the namespace, accounts and run the pods.

