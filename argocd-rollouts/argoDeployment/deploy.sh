#!/bin/bash
source ./init.sh
kubectl apply -f ./argoDeployment/namespace.yaml
kubectl apply -n argocd-ns -f https://raw.githubusercontent.com/argoproj/argo-cd/v1.8.3/manifests/install.yaml
kubectl apply -f ./argoDeployment/ingress.yml -n argocd-ns

