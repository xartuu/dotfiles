#!/bin/sh

# Adds Ondřej Surý PPA
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y && sudo apt-get dist-upgrade -y


# Installs PHP 5.6
command -v php5.6 >/dev/null 2>&1 || sudo apt-get install -y php5.6 php5.6-bcmath php5.6-cli php5.6-common php5.6-curl php5.6-fpm php5.6-gd php5.6-json php5.6-mbstring php5.6-mysql php5.6-opcache php5.6-readline php5.6-xml php5.6-zip

# Installs PHP 7.1
command -v php7.1 >/dev/null 2>&1 || sudo apt-get install -y php7.1 php7.1-bcmath php7.1-cli php7.1-common php7.1-curl php7.1-fpm php7.1-gd php7.1-json php7.1-mbstring php7.1-mysql php7.1-opcache php7.1-readline php7.1-xml php7.1-zip

# Installs PHP 7.2
command -v php7.2 >/dev/null 2>&1 || sudo apt-get install -y php7.2 php7.2-bcmath php7.2-cli php7.2-common php7.2-curl php7.2-fpm php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-xml php7.2-zip

# Installs PHP 7.3
command -v php7.3 >/dev/null 2>&1 || sudo apt-get install -y php7.3 php7.3-bcmath php7.3-cli php7.3-common php7.3-curl php7.3-fpm php7.3-gd php7.3-json php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-readline php7.3-xml php7.3-zip

# Installs PHP 7.4
command -v php7.4 >/dev/null 2>&1 || sudo apt-get install -y php7.4 php7.4-bcmath php7.4-cli php7.4-common php7.4-curl php7.4-fpm php7.4-gd php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-zip

# Installs PHP 8.0
command -v php8.0 >/dev/null 2>&1 || sudo apt-get install -y php8.0 php8.0-bcmath php8.0-bz2 php8.0-cli php8.0-common php8.0-curl php8.0-fpm php8.0-gd php8.0-mbstring php8.0-mysql php8.0-opcache php8.0-readline php8.0-xml php8.0-zip


# Sets default PHP version
sudo update-alternatives --set php $(command -v php7.4)


# Removes existing Composer
if [ -d "$HOME/.config/composer" ]
then
  rm -rf "$HOME/.config/composer"
fi


# Installs Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === file_get_contents('https://composer.github.io/installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv -f "composer.phar" "/usr/local/bin/composer"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"


# Takeout
composer global require tightenco/Takeout


# WP-CLI
composer global require wp-cli/wp-cli-bundle
wp package install aaemnnosttv/wp-cli-dotenv-command:^2.0
wp package install aaemnnosttv/wp-cli-valet-command:@stable
