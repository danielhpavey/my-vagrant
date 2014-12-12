#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y apache2 php5 php5-mysql libapache2-mod-php5 php5-gd
sudo rm -rf /var/www
sudo ln -fs /vagrant /var/www
# Add ServerName to httpd.conf
sudo echo "ServerName localhost" > /etc/apache2/httpd.conf
# Setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
  DocumentRoot "/vagrant/"
  ServerName localhost
  <Directory "/vagrant/">
    AllowOverride All
    Require all granted
  </Directory>
</VirtualHost>
EOF
)
sudo echo "${VHOST}" > /etc/apache2/sites-enabled/000-default.conf


# Mysql
# -----
# Ignore the post install questions
export DEBIAN_FRONTEND=noninteractive
# Install MySQL quietly
apt-get -q -y install mysql-server-5.5


# PHP stuff
# ---------
# Command-Line Interpreter
apt-get install -y php5-cli
# MySQL database connections directly from PHP
apt-get install -y php5-mysql
# cURL is a library for getting files from FTP, GOPHER, HTTP server
apt-get install -y php5-curl
# Module for MCrypt functions in PHP
apt-get install -y php5-mcrypt

# cURL
# ----
apt-get install -y curl

# Enable mcrypt
sudo php5enmod mcrypt

# Enable mod_rewrite
sudo a2enmod rewrite
# Restart apache
sudo service apache2 restart
