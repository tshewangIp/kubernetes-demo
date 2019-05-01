#!/bin/bash

ns=mysqldemo

# create directories for mount
mkdir -p /var/devops/mysql-pv
chmod 777 /var/devops/mysql-pv

# create namespace
kubectl create namespace $ns

# create resources
kubectl create -n $ns -f mysql-pv.yml --validate=false
kubectl create -n $ns -f mysql-deployment.yml --validate=false

