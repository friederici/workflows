#!/bin/bash

docker build . -t memstress:1.0
docker login --username=friederici
docker tag memstress:1.0 friederici/memstress:1.0
docker push friederici/memstress:1.0
