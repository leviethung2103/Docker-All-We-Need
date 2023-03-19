mkdir -p ./dags ./logs ./plugins
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.5.2/docker-compose.yaml'
docker-compose up -d 
