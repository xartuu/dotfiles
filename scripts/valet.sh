#!/bin/sh

# Installs dependencies
sudo apt-get install -y network-manager
sudo apt-get install -y libnss3-tools
sudo apt-get install -y jq
sudo apt-get install -y xsel
sudo apt-get install -y nginx


# Removes existing
if [ -d "$HOME/.valet" ]
then
  valet stop
  rm -rf "$HOME/.valet"
fi


# Installs Valet
composer global require valeryan/valet-wsl
valet install


# Copies config
ln -snf "$DOTFILES/configs/valet.json" "$HOME/.valet/config.json"


# Instals Valet Dashboard
export VALET_DASHBOARD="$HOME/.valet/Dashboard"
git clone https://github.com/xartuu/valet-dashboard "$VALET_DASHBOARD"
git clone https://github.com/FortAwesome/Font-Awesome "$VALET_DASHBOARD/assets/fonts/fontawesome-free-5"


# Restarts Valet
valet start
valet status
