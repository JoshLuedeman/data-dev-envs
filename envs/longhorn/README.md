# Longhorn
It is a Kuberenetes solution for deploying persistant addressable storage on to Kubernetes. We will be using this to deploy or data lake.
## Overview
Longhorn is a lightweight, reliable, and powerful distributed block storage system for Kubernetes.

Longhorn implements distributed block storage using containers and microservices. Longhorn creates a dedicated storage controller for each block device volume and synchronously replicates the volume across multiple replicas stored on multiple nodes. The storage controller and replicas are themselves orchestrated using Kubernetes.
> Credit to [Longhorn docs](https://longhorn.io/docs)

## Installation
For installation, instead of walking you through, I felt it would be better to link directly to the documentation from Longhorn. That way, if there are changes to the installation steps, you won't be relying on me to keep up my documentation with their's.

You can find steps to install Longhorn with the Kubernetes client kubectl [here](https://longhorn.io/docs/1.4.0/deploy/install/install-with-kubectl/).

> If you are running on Minikube, you will need to alter the yaml file to lower the number of required replicas so that it will deploy on a single node Minikube cluster. I have included my own version of the YAML file for just this purpose, in this repo. It will install Longhorn 1.4.