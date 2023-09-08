# Jenkins 
## Overview
Jenkins is an open source tool to build deployment pipelines with. This should be on of the first systems that you deploy to your environment. 

We will be using the helm chart created by bitnami for this example. To do this we need to make sure that we have [helm installed](https://helm.sh/docs/intro/install/). 

## Installation

1. Once Helm is installed, we will use the follwing command to add the bitnami repo to our helm client.

```
helm repo add bitnami https://charts.bitnami.com/bitnami
```

2. Once that command runs successfully, you want to make sure that the repo was setup correctly. To do this we will run a command to update the repo that we just added.

> This command should run successfully. If it has not, refer back to the helm documentation to remove the bitnami repo and try again.

```
helm repo update bitnami
```

3. Now that we have the repo added to our client, and updated the charts contained in that repo, we are now ready to deploy Jenkins. To install the Jenkins chart, we want a namespace specifically for Jenkins to create a level of deliniation between the services that we will be deploying in the environment. To do that, each application will have its own namespace in Kubernetes. In the following code block, we will create the 'jenkins' namespace and install the Helm chart for Jenkins in to the newly created namespace.

```
kubectl create namespace jenkins 
helm install jenkins bitnami/jenkins --namespace jenkins
```

4. The output of installing the Jenkins Helm chart will give you the commands needed to use your new deployment of Jenkins including how to obtain the external IP and the password created when the chart is deployed. The output should look similar to this:

```
NAME: jenkins
LAST DEPLOYED: Sat Jan 1 00:00:00 9999
NAMESPACE: jenkins
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: jenkins
CHART VERSION: 11.0.12
APP VERSION: 2.375.2

** Please be patient while the chart is being deployed **

1. Get the Jenkins URL by running:

** Please ensure an external IP is associated to the jenkins service before proceeding **
** Watch the status using: kubectl get svc --namespace jenkins -w jenkins **

  export SERVICE_IP=$(kubectl get svc --namespace jenkins jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
  echo "Jenkins URL: http://$SERVICE_IP/"

2. Login with the following credentials

  echo Username: user
  echo Password: $(kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-password}" | base64 -d)
```
> If you are using PowerShell, do not pipe the command to base64 as laid out in the instructions to get the password. Drop everything beginning with the '|' and paste that value in to the following command in between the double quotes:
```
[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String(""))
```

## Wrap-Up
I have created a onetime run bash script to execute these steps. However if you have already added the bitnami repo, created a Jenkins namespace, or installed a chart named Jenkins, this bash script will create errors. It is very basic and "simple minded".

Now that you have successfully deployed Jenkins, test out the login page and make sure that your external-ip and password for your generic user are working by logging in to the Jenkins dashboard. If you are able to login, you are all set.

**- Onward and Upward**