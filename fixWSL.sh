#!/bin/sh

# Tells WSL to stop automatic generation the /etc/resolv.conf file
sudo rm -rf "/etc/wsl.conf"
sudo tee /etc/wsl.conf << "EOF"
[network]
generateResolvConf = false
EOF
