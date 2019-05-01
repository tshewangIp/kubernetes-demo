#!/bin/bash

ns=mywordpress

# create directories for mount
mkdir -p /var/devops/wp-pv
mkdir -p /var/devops/wpmysql-pv
chmod 777 /var/devops/wp*

# create namespace
kubectl create namespace $ns

# create resources
kubectl create -n $ns -f wpmysql-pv.yml --validate=false
kubectl create -n $ns -f wp-pv.yml --validate=false
#created the secret with base 64 encoder, decode with base 64
kubectl create -n $ns -f secret-pass.yml --validate=false
kubectl create -n $ns -f mysql-deployment.yaml --validate=false
#stable and reliable for service, this will create the services when there is crashes and others
kubectl create -n $ns -f wordpress-deployment.yaml --validate=false
#scaling the container, create and delete the container accoriding the requirements
kubectl create -n $ns -f autoscale-wordpress.yml --validate=false

