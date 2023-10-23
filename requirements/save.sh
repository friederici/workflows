#!/bin/bash

if (( $# == 0 )); then
  echo "usage: $0 <podname>"
fi

minikube kubectl -- get pod $1 -o yaml -n workflows > /media/sf_share/$1.yaml
