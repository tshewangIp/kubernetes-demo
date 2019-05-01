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
kubectl create -n $ns -f secret-pass.yml --validate=false
kubectl create -n $ns -f mysql-deployment.yaml --validate=false
kubectl create -n $ns -f wordpress-deployment.yaml --validate=false
kubectl create -n $ns -f autoscale-wordpress.yml --validate=false

