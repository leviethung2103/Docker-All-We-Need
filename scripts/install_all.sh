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


sudo apt-get install -y nvidia-container-toolkit


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
docker run hello-world

# install for windows, linux 
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

curl -L https://github.com/docker/machine/releases/download/v0.16.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
