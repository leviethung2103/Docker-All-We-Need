# install for windows, linux 
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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
