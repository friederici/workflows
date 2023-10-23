#!/bin/bash

if (( $# == 0 )); then
  nodes=1
else
  nodes=$1
fi

minikube start --nodes $nodes --feature-gates=InPlacePodVerticalScaling=true
minikube addons enable volumesnapshots
minikube addons enable csi-hostpath-driver
minikube addons disable storage-provisioner
minikube addons disable default-storageclass
minikube kubectl -- patch storageclass csi-hostpath-sc -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
minikube kubectl -- apply -f k8s.yaml
minikube mount /workflows/:/workflows/ &
#minikube dashboard &

