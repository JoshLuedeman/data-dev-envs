#! /bin/bash
kubectl create namespace jenkins 
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update bitnami
helm install jenkins bitnami/jenkins --namespace jenkins