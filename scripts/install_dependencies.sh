sudo apt-get update -y
sudo apt-get upgrade
sudo apt-get install -y gcc python3-dev libatlas-base-dev libv4l-dev libxvidcore-dev libx264-dev libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev libpng-dev libtiff-dev build-essential cmake unzip pkg-config
sudo apt-get install gfortranlibgtk-3-dev 
sudo apt-get install libncurses5-dev

# Install the NVTOP
cd ~/Downloads
git clone https://github.com/Syllo/nvtop.git
mkdir -p nvtop/build && cd nvtop/build
cmake ..
make
