#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
apt-get install php5
apt-get install php5-mysql
rm -rf /var/www
ln -fs /vagrant /var/www
