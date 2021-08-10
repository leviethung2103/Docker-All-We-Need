sudo apt-get update -y
sudo apt-get upgrade
sudo apt-get install -y gcc python3-dev libatlas-base-dev libv4l-dev libxvidcore-dev libx264-dev libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev libpng-dev libtiff-dev build-essential cmake unzip pkg-config
sudo apt-get install gfortranlibgtk-3-dev 
sudo apt-get install libncurses5-dev

# Install Docker 
wget https://raw.githubusercontent.com/leviethung2103/Docker-All-We-Need/master/scripts/install_docker.sh
chmod +x install_docker.sh
./install_docker.sh

# Install code-server
curl -fsSL https://code-server.dev/install.sh | sh

# Install the NVTOP
cd ~/Downloads
git clone https://github.com/Syllo/nvtop.git
mkdir -p nvtop/build && cd nvtop/build
cmake ..
make

sudo make install
