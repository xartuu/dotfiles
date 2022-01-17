#!/bin/sh


# Removes existing oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]
then
  rm -rf "$HOME/.oh-my-zsh"
fi


# Installs ZSH and configure oh-my-zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


# Exports variables
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"


# Copies my setup
ln -snf "$DOTFILES/configs/.bashrc" "$HOME/.bashrc"
ln -snf "$DOTFILES/configs/.zshrc" "$HOME/.zshrc"
ln -snf "$DOTFILES/zsh_custom/"*".zsh" "$ZSH_CUSTOM"



# Themes

## Starship
ln -snf "$DOTFILES/configs/starship.toml" "$HOME/.config/starship.toml"
command -v starship > /dev/null 2>&1 || sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --force

## Spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -snf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

## Syntax highlighting
git clone https://github.com/dracula/zsh-syntax-highlighting.git "$ZSH_CUSTOM/themes/zsh-syntax-highlighting"



# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions" # Autosuggestions plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" # zsh-syntax-highlighting
