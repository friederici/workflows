#!/bin/bash

minikube kubectl -- exec --stdin --tty workflow-scheduler -n workflows -- /bin/sh

