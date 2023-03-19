# install for windows, linx - Docker-Compose version is updated from 1.26 to 1.29.1 - Used for Airflow
# Ref: https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# install for Arm architecture like Raspberry Pi, Box
sudo apt-get install libffi6 libffi-dev
sudo apt-get install python-dev
sudo apt-get install python3-dev
rm -rf /usr/local/bin/docker-compose 
rm -rf /usr/bin/docker-compose
pip3 uninstall docker-compose
pip3 install docker-compose
