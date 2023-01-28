#!/bin/bash
sudo apt update 
sudo apt upgrade -y
# install docker
sudo apt install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  neofetch \
  python3 \ 
  python3-pip
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker
# install vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium -y
# install amd gpu rocm
sudo apt-get update
wget https://repo.radeon.com/amdgpu-install/5.4.2/ubuntu/jammy/amdgpu-install_5.4.50402-1_all.deb
sudo apt-get install -y ./amdgpu-install_5.4.50402-1_all.deb 
sudo amdgpu-install --usecase=hiplibsdk,rocm -y
