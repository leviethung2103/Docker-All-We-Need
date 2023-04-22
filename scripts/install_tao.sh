#!/bin/sh

sudo apt update
sudo apt install python-pip python3-pip unzip
pip3 install --upgrade pip

pip3 install virtualenvwrapper

# Install Cmake
sudo mkdir -p /tmp_dir_cmake && sudo chmod -R 777 /tmp_dir_cmake
cd /tmp_dir_cmake
wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4-Linux-x86_64.sh
chmod +x cmake-3.14.4-Linux-x86_64.sh
sudo ./cmake-3.14.4-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license
rm ./cmake-3.14.4-Linux-x86_64.sh

python3.6 -m pip install nvidia-pyindex

# Install Tensorflow
python3.6 -m pip install https://developer.download.nvidia.com/compute/redist/nvidia-tensorflow/nvidia_tensorflow-1.15.5+nv22.09-6040196-cp36-cp36m-linux_x86_64.whl 
python3.6 -m pip install https://developer.download.nvidia.com/compute/redist/nvidia-horovod/nvidia_horovod-0.25.0+nv22.09-6040196-cp36-cp36m-linux_x86_64.whl

# Install dependencies
python3.6 -m pip install nvidia-eff==0.5.3
python3.6 -m pip install nvidia-tao==4.0.0
python3.6 -m pip install --ignore-installed PyYAML -r PATH_TO_COLAB_NOTEBOOKS/tensorflow/requirements-pip.txt -f https://download.pytorch.org/whl/torch_stable.html --extra-index-url https://developer.download.nvidia.com/compute/redist

# Install code related wheels
python3.6 -m pip install nvidia-tao-tf1==4.0.0.657.dev0 

wget https://raw.githubusercontent.com/NVIDIA-AI-IOT/nvidia-tao/main/tensorflow/requirements-pip-desktop.txt

pip install -r requirements-pip-desktop.txt

wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/tao-getting-started/versions/4.0.1/zip -O getting_started_v4.0.1.zip
unzip -u getting_started_v4.0.1.zip  -d ./getting_started_v4.0.1 && rm -rf getting_started_v4.0.1.zip && cd ./getting_started_v4.0.1

cd /root/getting_started_v4.0.1/notebooks/tao_launcher_starter_kit

pip install jupyterlab

jupyter lab --ip 0.0.0.0 --port 5000 --allow-root