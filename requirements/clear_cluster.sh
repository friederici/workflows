#!/bin/bash

kubectl delete namespace workflows
kubectl delete pv nfs-pv
kubectl delete pv nfs-hostpath-pv
kubectl delete pv workflows-pv
kubectl delete pv workflows-hostpath-pv

sleep 30

