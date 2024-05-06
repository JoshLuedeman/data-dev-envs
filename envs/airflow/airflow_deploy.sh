helm install airflow apache-airflow/airflow --namespace airflow --create-namespace --set executor=KubernetesExecutor
