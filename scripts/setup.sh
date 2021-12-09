#!/bin/sh

# Makes sudo not prompt them for a password
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER


# Sets the DNS server
sudo rm -rf "/etc/resolv.conf"
sudo tee /etc/resolv.conf << "EOF"
nameserver 1.1.1.2
nameserver 1.0.0.2
EOF


# Updates and installs basic packages
sudo apt-get update -y && sudo apt-get dist-upgrade -y
sudo apt-get install -y zip
sudo apt-get install -y unzip
sudo apt-get install -y git
sudo apt-get install -y openssh-client
