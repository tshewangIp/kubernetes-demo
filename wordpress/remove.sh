#!/bin/bash

ns=mywordpress

# delete resources
kubectl delete -n $ns -f autoscale-wordpress.yml
kubectl delete -n $ns -f wordpress-deployment.yaml
kubectl delete -n $ns -f mysql-deployment.yaml
kubectl delete -n $ns -f secret-pass.yml
kubectl delete -n $ns -f wpmysql-pv.yml
kubectl delete -n $ns -f wp-pv.yml

# delete namespace
kubectl delete namespace $ns

# delete mount paths
rm -rf /var/devops/wp*
