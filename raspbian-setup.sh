#!/bin/sh

passwd
mkdir /home/pi/code
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y python3-pip python3-smbus i2c-tools git
curl -fsSL get.docker.com | sh
sudo usermod -aG docker pi
sudo pip install docker-compose
sudo service ssh start

sudo update-rc.d ssh defaults
sudo update-rc.d ssh enable
sudo sed -i -e 's/\#dtparam=spi=on/dtparam=spi=on/g' /boot/config.txt
echo "Done. Restarting server..."
sleep 10
sudo reboot
