#!/bin/bash

ns=kube-system

# create resources
kubectl create -n $ns -f kubernetes-dashboard.yaml --validate=false
kubectl create -n $ns -f sa-admin.yml --validate=false
kubectl create -n $ns -f dashboard-admin.yml --validate=false

kubectl -n kube-system get secret | grep kubernetes-dashboard-token | awk '{print "secret/"$1}' | xargs kubectl describe -n kube-system
kubectl -n kube-system get secret | grep kubernetes-dashboard-token | awk '{print "secret/"$1}' | xargs kubectl describe -n kube-system > token.txt


echo ""
echo "run 'kubectl proxy' command from your system (or if you created tunnel than run it from the master machine)"
echo "open the following link in browser and paste the above token to login."
echo ""
echo "http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
echo ""
