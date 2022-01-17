#!/bin/sh

# Installs MySQL
sudo apt-get install -y mysql-client mysql-server
mysql --version

sudo usermod -d /var/lib/mysql/ mysql
sudo service mysql start
sudo  mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY ''; FLUSH PRIVILEGES;"
sudo service mysql restart
