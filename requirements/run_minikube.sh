#!/bin/bash

if (( $# == 0 )); then
  nodes=1
else
  nodes=$1
fi

minikube start --nodes $nodes --feature-gates=InPlacePodVerticalScaling=true
minikube kubectl -- apply -f k8s-minikube.yaml
minikube mount /workflows/:/workflows/ &
#minikube dashboard &

