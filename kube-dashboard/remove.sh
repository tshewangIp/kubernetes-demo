#!/bin/bash

ns=kube-system

# create resources
kubectl delete -n $ns -f kubernetes-dashboard.yaml
kubectl delete -n $ns -f sa-admin.yml
kubectl delete -n $ns -f dashboard-admin.yml

