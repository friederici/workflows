#!/bin/bash

gcc vmem.c

docker build . -t vmem:1.0
docker login --username=friederici
docker tag vmem:1.0 friederici/vmem:1.0
docker push friederici/vmem:1.0
