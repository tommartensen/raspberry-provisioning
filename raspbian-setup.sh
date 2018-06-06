#!/bin/sh

passwd
mkdir /home/pi/code
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y oracle-java8-jdk python3-pip python3-smbus i2c-tools git ruby ruby-dev
curl -fsSL get.docker.com | sh
sudo usermod -aG docker pi
sudo pip3 install docker-compose

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>~/.profile
echo 'export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"' >>~/.profile
echo 'export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"' >>~/.profile
source ~/.profile

brew install maven

mkdir -p /tmp/ && cd /tmp/ && git clone git://git.drogon.net/wiringPi && cd wiringPi && ./build
curl -s get.pi4j.com | sudo bash

sudo service ssh start

sudo update-rc.d ssh defaults
sudo update-rc.d ssh enable
sudo sed -i -e 's/\#dtparam=spi=on/dtparam=spi=on/g' /boot/config.txt
echo "Done. Restarting server..."
sleep 10
sudo reboot
