#!/bin/bash

sudo apt update
sudo apt install python-pip python3-pip unzip
pip3 install --upgrade pip

# conda info --base check the locaiton of conda

export PATH="/opt/conda/bin:$PATH"
source /opt/conda/etc/profile.d/conda.sh


pip3 install virtualenvwrapper

conda deactivate # if has anaconda

# Install Cmake
sudo mkdir -p /tmp_dir_cmake && sudo chmod -R 777 /tmp_dir_cmake
cd /tmp_dir_cmake
wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4-Linux-x86_64.sh
chmod +x cmake-3.14.4-Linux-x86_64.sh
sudo ./cmake-3.14.4-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license
rm ./cmake-3.14.4-Linux-x86_64.sh

cd /root

wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/tao-getting-started/versions/4.0.1/zip -O getting_started_v4.0.1.zip
unzip -u getting_started_v4.0.1.zip  -d ./getting_started_v4.0.1 && rm -rf getting_started_v4.0.1.zip && cd ./getting_started_v4.0.1

# use the python3.6
pip3 install virtualenv
virtualenv -p python3.6 myenv
source myenv/bin/activate

pip install nvidia-pyindex

# Install Tensorflow
pip install https://developer.download.nvidia.com/compute/redist/nvidia-tensorflow/nvidia_tensorflow-1.15.5+nv22.09-6040196-cp36-cp36m-linux_x86_64.whl 
pip install https://developer.download.nvidia.com/compute/redist/nvidia-horovod/nvidia_horovod-0.25.0+nv22.09-6040196-cp36-cp36m-linux_x86_64.whl

# Install dependencies
pip install nvidia-eff==0.5.3
pip install nvidia-tao==4.0.0

wget https://raw.githubusercontent.com/NVIDIA-AI-IOT/nvidia-tao/main/tensorflow/

pip install --ignore-installed PyYAML -r requirements-pip-desktop.txt -f https://download.pytorch.org/whl/torch_stable.html --extra-index-url https://developer.download.nvidia.com/compute/redist

# Install code related wheels
pip install nvidia-tao-tf1==4.0.0.657.dev0 gdown 

pip install -r requirements-pip-desktop.txt

cd /root/getting_started_v4.0.1/notebooks/tao_launcher_starter_kit
pip install traitlets
pip install pygments

pip install jupyterlab

jupyter lab --ip 0.0.0.0 --port 5000 --allow-root