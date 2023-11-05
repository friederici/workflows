#!/bin/bash

if (( $# == 0 )); then
  nodes=1
else
  nodes=$1
fi

minikube start --nodes $nodes --feature-gates=InPlacePodVerticalScaling=true --memory 6144 --cpus 3

minikube kubectl -- apply -f k8s.yaml
minikube kubectl -- apply -f volume-minikube.yaml

minikube mount /workflows/:/workflows/ &
#minikube dashboard &

