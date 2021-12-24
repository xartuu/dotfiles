#!/bin/sh

# Configs
ln -snf "/mnt/c/Users/artuu/.gitconfig" "$HOME/.gitconfig"

# Programs
mkdir -p "$HOME/bin"
ln -snf "$(command -v plink.exe)" "$HOME/bin/ssh"
ln -snf "$(command -v pscp.exe)" "$HOME/bin/scp"
ln -snf "$(command -v gpg.exe)" "$HOME/bin/gpg"
