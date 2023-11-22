#!/bin/bash

kubectl delete namespace workflows
kubectl delete pv nfs-pv
kubectl delete pv workflows-pv


