#!/bin/bash

kubectl apply -f /workflows/requirements/k8s.yaml
kubectl apply -f /workflows/requirements/volume-node1.yaml
kubectl apply -f /workflows/requirements/volume-nfs.yaml
kubectl apply -f /workflows/requirements/cws.yaml

kubectl wait --for=condition=ready pod workflow-scheduler --namespace workflows
