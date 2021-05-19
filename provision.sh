#!/bin/bash

set -e

PASS=Toor1234
USER=$1
HOST=$2

export DEBIAN_FRONTEND=noninteractive

apt-get purge -y unattended-upgrades

apt-get update
apt-get upgrade -y

# Add user and allow sudo without password


groupadd -f $USER
useradd -p $(openssl passwd -crypt $PASS) $USER --badnames -g $PASS --groups sudo --shell /bin/bash
passwd --expire $USER

echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/99-base-users
chmod 440 /etc/sudoers.d/99-base-users

# Set own hostname
hostnamectl set-hostname $HOST

echo "Your Network device configuration: "
ip addr show

echo "Done. Restarting server..."
sleep 10
reboot -h
