# update and upgrade
apt-get update && apt-get upgrade

# NGINX 
apt-get install nginx
sudo add-apt-repository ppa:certbot/certbot
sudo apt install python-certbot-nginx

# RCONE
cd /root/
wget https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
\cp rclone-v*-linux-amd64/rclone /usr/sbin/
rm -rf rclone-*

# Download the configure file
wget https://raw.githubusercontent.com/leviethung2103/Docker-All-We-Need/master/nginx-conf/code.conf
wget https://raw.githubusercontent.com/leviethung2103/Docker-All-We-Need/master/nginx-conf/nginx.conf
cp nginx.conf /etc/nginx/nginx.conf 
cp code.conf /etc/nginx/sites-enabled/code.conf

# install for windows, linux 
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Uninstall old versions 
sudo apt-get remove docker docker-engine docker.io containerd runc -y 
sudo apt-get update -y 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y 
sudo apt-get install docker-ce docker-ce-cli containerd.io -y 
sudo apt-cache madison docker-ce
sudo apt-get install docker-ce="5:18.09.1~3-0~ubuntu-xenial" docker-ce-cli="5:18.09.1~3-0~ubuntu-xenial" containerd.io

# Verify that Docker engine is installed correctly 
sudo docker run hello-world

# Configure Docker to start on boot
# sudo systemctl enable docker
# sudo systemctl disable docker

# Post install 
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Please log out and log back to re-evaluate group membership if it doesn't work"

newgrp docker 
docker run hello-worldz


