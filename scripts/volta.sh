#!/bin/sh

# Removes existing Volta
if [ -d "$HOME/.volta" ]
then
  rm -rf "$HOME/.volta"
fi

# Volta
curl https://get.volta.sh | bash -s -- --skip-setup

# Nodejs
volta install node@16
volta install node@14
volta install node@12
volta install node

# Yarn
volta install yarn

# Global packages
yarn global add eslint nodemon npm-run-all prettier tldr tsc-watch typescript

# Volta List
volta list
