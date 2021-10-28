#!/usr/bin/env bash

# Shutdowns WSL instance
alias sd="shutdown"
alias die="shutdown all"
function shutdown() {
  if [ "$@" = "all" ]; then
    wsl.exe --shutdown
  elif [ $# -eq 0 ]; then
    wsl.exe --terminate $WSL_DISTRO_NAME;
  else
    wsl.exe --terminate "$@"
  fi;
}


# Creates a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}


# Opens the given location or the current directory
alias o="open"
alias explorer="open"
function open() {
  if [ $# -eq 0 ]; then
    explorer.exe .;
  else
    if [ -d $1 ]; then
      explorer.exe `wslpath -aw "$1"`;
    else
      cmd.exe /C start "$1"
    fi;
  fi;
}


# Changes default PHP version
alias pv="phpversion"
alias phpv="phpversion"
function phpversion() {
  if [ $# -eq 0 ]; then
    sudo update-alternatives --config php;
  else
    sudo update-alternatives --set php `command -v "php$1"`;
  fi;
}


# Manages databases
alias db="database"
function database {
    if [ "$1" = "refresh" ] || [ "$1" = "r" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ] || [ "$1" = "c" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ] || [ "$1" = "d" ]; then
        mysql -uroot -e "drop database $2"
    fi
}


# Opens database
alias odb="opendatabase"
alias opendb="opendatabase"
function opendatabase () {
  [ ! -f .env ] && { echo "No .env file found."; exit 1; }

  DB_CONNECTION=$(grep DB_CONNECTION .env | grep -v -e "^\s*#" | cut -d "=" -f 2-)
  DB_HOST=$(grep DB_HOST .env | grep -v -e "^\s*#" | cut -d "=" -f 2-)
  DB_PORT=$(grep DB_PORT .env | grep -v -e "^\s*#" | cut -d "=" -f 2-)
  DB_DATABASE=$(grep DB_DATABASE .env | grep -v -e "^\s*#" | cut -d "=" -f 2-)
  DB_USERNAME=$(grep DB_USERNAME .env | grep -v -e "^\s*#" | cut -d "=" -f 2-)
  DB_PASSWORD=$(grep DB_PASSWORD .env | grep -v -e "^\s*#" | cut -d "=" -f 2-)

  DB_URL="${DB_CONNECTION}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}"

  echo "Opening ${DB_URL}"
  open $DB_URL
}