#!/bin/bash

ns=mysqldemo

# delete resources
kubectl delete -n $ns -f mysql-deployment.yml
kubectl delete -n $ns -f mysql-pv.yml

# delete namespace
kubectl delete namespace $ns

# delete directories from mount
# rm -rf /var/devops/mysql-pv
