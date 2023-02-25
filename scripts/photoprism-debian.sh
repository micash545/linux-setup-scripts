#!/bin/sh
sudo apt update && sudo apt upgrade -y
sudo apt install -y gcc \
g++ \
git \
gnupg \
make \
zip \
unzip \
ffmpeg
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
wget https://golang.org/dl/go1.19.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
sudo ln -s /usr/local/go/bin/go /usr/local/bin/go
rm go1.19.3.linux-amd64.tar.gz
wget https://dl.photoprism.org/tensorflow/linux/libtensorflow-linux-avx2-1.15.2.tar.gz
sudo tar -C /usr/local -xzf libtensorflow-linux-avx2-1.15.2.tar.gz
sudo ldconfig
rm libtensorflow-linux-avx2-1.15.2.tar.gz
sudo mkdir -p /opt/photoprism/bin
git clone https://github.com/photoprism/photoprism.git
cd photoprism
git checkout release
sudo make all
sudo ./scripts/build.sh prod /opt/photoprism/bin/photoprism
sudo cp -a assets/ /opt/photoprism/assets/
NODE_OPTIONS=--max_old_space_size=2048 make all
sudo useradd --system photoprism
sudo mkdir /var/lib/photoprism
sudo chown photoprism:photoprism /var/lib/photoprism
cd /var/lib/photoprism
