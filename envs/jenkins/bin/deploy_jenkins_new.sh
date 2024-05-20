#! /bin/bash
helm install jenkins jenkins/jenkins --namespace jenkins --create-namespace --set Master.ServiceType=NodePort
