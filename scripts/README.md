### install_all.sh 
Install the docker, docker-compose, docker-machine and nvidia-docker.


### Install TAO Toolkit
Setup on vast.ai 

## Usage
```bash
bash install_all.sh
```

If you cannot install the nvidia-containre-toolkit, please follow this installation guide
> https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

## Install Docker for TV BOX - X9 Mini

If you've encountered error related to connection time out.
```bash
sudo dpkg-reconfigure ca-certificates
```

Download the right script and install Docker on the Raspberry Pi environment. 



```bash
sudo nano /etc/apt/sources.list.d/docker.list
# change debian -> ubuntu
deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian jammy stable

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

Adding users to the Docker group:
sudo usermod -aG docker [user_name]

Log out and login again
```bash
docker version
```

## Install Siyuan 

```bash
docker run -d --restart always -v /root/Downloads/siyuan/workspace:/siyuan/workspace -p 26053:6806 -u 0:1000 b3log/siyuan --workspace=/siyuan/workspace/ --accessAuthCode=xxx
```

## Dependencies 
```bash
bash install_dependencies.sh
```
