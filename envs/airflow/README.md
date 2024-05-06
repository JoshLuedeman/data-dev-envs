# Jenkins 
## Overview
Jenkins is an open source tool to build deployment pipelines with. This should be on of the first systems that you deploy to your environment. 

We will be using the helm chart created by bitnami for this example. To do this we need to make sure that we have [helm installed](https://helm.sh/docs/intro/install/). 

## Installation

1. We will use the follwing command to add the apache-airflow repo to our helm client.

```
helm repo add apache-airflow https://airflow.apache.org
```

2. Once that command runs successfully, you want to make sure that the repo was setup correctly. To do this we will run a command to update the repo that we just added.

> This command should run successfully. If it has not, refer back to the helm documentation to remove the bitnami repo and try again.

```
helm repo update apache-airflow
```

3. Now that we have the repo added to our client, and updated the charts contained in that repo, we are now ready to deploy Jenkins. To install the Jenkins chart, we want a namespace specifically for Jenkins to create a level of deliniation between the services that we will be deploying in the environment. To do that, each application will have its own namespace in Kubernetes. In the following code block, we will create the 'jenkins' namespace and install the Helm chart for Jenkins in to the newly created namespace.

```
kubectl create namespace airflow 
helm install airflow apache-airflow/airflow --namespace airflow
```

4. The output of installing the Jenkins Helm chart will give you the commands needed to use your new deployment of Jenkins including how to obtain the external IP and the password created when the chart is deployed. The output should look similar to this:

```
NAME: airflow
LAST DEPLOYED: Fri May  3 15:24:04 2024
NAMESPACE: airflow
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Thank you for installing Apache Airflow 2.8.3!

Your release is named airflow.
You can now access your dashboard(s) by executing the following command(s) and visiting the corresponding port at localhost in your browser:

Airflow Webserver:     kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow
Default Webserver (Airflow UI) Login credentials:
    username: admin
    password: admin
Default Postgres connection credentials:
    username: postgres
    password: postgres
    port: 5432

You can get Fernet Key value by running the following:

    echo Fernet Key: $(kubectl get secret --namespace airflow airflow-fernet-key -o jsonpath="{.data.fernet-key}" | base64 --decode)

WARNING:
    Kubernetes workers task logs may not persist unless you configure log persistence or remote logging!
    Logging options can be found at: https://airflow.apache.org/docs/helm-chart/stable/manage-logs.html
    (This warning can be ignored if logging is configured with environment variables or secrets backend)

###########################################################
#  WARNING: You should set a static webserver secret key  #
###########################################################

You are using a dynamically generated webserver secret key, which can lead to
unnecessary restarts of your Airflow components.

Information on how to set a static webserver secret key can be found here:
https://airflow.apache.org/docs/helm-chart/stable/production-guide.html#webserver-secret-key
```

## Wrap-Up
<Under construction>

**- Onward and Upward**
