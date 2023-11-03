#!/bin/bash

kubectl apply -f k8s.yaml
kubectl apply -f volume-node1.yaml
kubectl apply -f cws.yaml

