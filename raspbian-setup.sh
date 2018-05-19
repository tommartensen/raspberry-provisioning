#!/bin/sh

passwd
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y python-pip python3-pip git
curl -fsSL get.docker.com | sh
sudo usermod -aG docker pi
sudo pip install docker-compose
sudo service ssh start

sudo update-rc.d ssh defaults
sudo update-rc.d ssh enable

mkdir /home/pi/code

echo "Done."
