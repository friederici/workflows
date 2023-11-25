#!/bin/bash

kubectl apply -f /workflows/requirements/k8s.yaml
kubectl apply -f /workflows/requirements/volume-hostpath.yaml
kubectl apply -f /workflows/requirements/volume-nfs-hostpath.yaml
kubectl apply -f /workflows/requirements/cws-hostpath.yaml

kubectl wait --for=condition=ready pod workflow-scheduler --namespace workflows

sleep 30

