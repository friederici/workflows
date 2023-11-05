#!/bin/bash

docker build . -t memstress:latest
docker login --username=friederici
docker tag memstress friederici/memstress
docker push friederici/memstress
