#!/bin/sh

# Tells WSL to stop automatic generation the /etc/resolv.conf file
cat << "EOF" | sudo tee /etc/wsl.conf
[network]
generateResolvConf = false
EOF