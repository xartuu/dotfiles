#!/bin/sh

# Makes sudo not prompt them for a password
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER


# Sets the DNS server
sudo rm -rf "/etc/resolv.conf"
sudo tee /etc/resolv.conf << "EOF"
nameserver 1.1.1.2
nameserver 1.0.0.2
EOF
# Makes the file immutable and won't be overwritten next time you start wsl
# Use `sudo chattr -i /etc/resolv.conf` to edit this file again
sudo chattr +i /etc/resolv.conf


# Updates and installs basic packages
sudo apt-get update -y && sudo apt-get dist-upgrade -y
sudo apt-get install -y zip
sudo apt-get install -y unzip
sudo apt-get install -y git
sudo apt-get install -y openssh-client

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
