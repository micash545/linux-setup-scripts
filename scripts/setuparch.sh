#!/bin/sh
sudo pacman -Syyu docker docker-compose python3 python-pip git base-devel --noconfirm
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker
# install yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ~
# install vscodium
yay -S vscodium-bin --noconfirm
