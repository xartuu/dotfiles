#!/bin/sh

# Exports
export DOTFILES="$HOME/.dotfiles"

# Clone dotfiles repo
if [ ! -d "$DOTFILES" ]
then
  git clone https://github.com/artuupl/dotfiles.git $DOTFILES
fi

# Paths
. "$DOTFILES/zsh_custom/path.zsh"

# Runs scripts
sudo chmod -R +x $DOTFILES/scripts
$DOTFILES/scripts/setup.sh # Changes settings and installs needed packages
$DOTFILES/scripts/folders.sh # Creates folders
$DOTFILES/scripts/shortcuts.sh # Creates shortcuts
$DOTFILES/scripts/terminal.sh # Installs ZSH and configures terminal
$DOTFILES/scripts/volta.sh # Installs and configures Volta
$DOTFILES/scripts/php.sh # Installs PHP and configures environment
$DOTFILES/scripts/valet.sh # Installs and configures Valet
$DOTFILES/scripts/databases.sh # Installs and configures databases


# Removes no longer required packages
sudo apt-get autoremove -y


# Changes defauld shell
if [ "$SHELL" != "$(command -v zsh)" ]
then
  echo "Enter your sudo password to change the shell to zsh.";
  chsh -s `command -v zsh`
fi