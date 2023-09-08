# Environments
As a developer, the ability to spin up environments for them to do their work, in a timely manner is directly related to the ability to get work done quickly. These folders contain the bash scripts to deploy working dev environments on Minikube(Kubernetes) for different scenarios.

## How to use
Each environment will have a folder to itself. Every environment will have a README file to describe its services, use case, and a short how-to explaining the process to deploy it. Each folder will have Kubernetes CRD's and Docker container files to create the needed services in the environment. 

## Table of Contents

| Environment Name | Description | Link |
|------------------|-------------|------|
| Jenkins          | Jenkins environment for automating deployment of environments | [Link](./jenkins/README.md) |
| Terraform        | Infrastructure as code solution for building environments | TBD |
| Longhorn            | Kuberenetes solution for deploying persistant addressable storage on to Kubernetes. We will be using this to deploy or data lake.       | TBD  |
| Kafka            | Kafka environment is for message brokering. This should be used when building a streaming messaging platform       | TBD  |
| Spark            | Spark environment is for processing batch or streaming data. This environment will include a spark master and spark workers. It should also include a notebook system that is connected to it as well | TBD|
| Airflow | Apache solution for building execution and orchestration pipelines | TBD |

## How to submit updates or changes

If you are having an issue with an environment please feel free to submit a change if you can fix the problem, or submit a well defined issue so that it is easy to understand the problem you are experiencing.

If you would like to submit a code change/enhancement, feel free to follow standard procedures and submit a pull request with your changes. Once it is reviewed and validated, it will be approved.

## Questions

Please submit any questions about these environments as issues and tag them as questions. If you have any problems, please create an issue for the problem, even if you plan on developing the fix. If you are developing a fix for the issue, please open a pull request for the fix and connect it to the issue.
