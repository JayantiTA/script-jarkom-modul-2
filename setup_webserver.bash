#!/bin/bash

cp /etc/resolv.conf resolv.conf;
echo nameserver 192.168.122.1 > /etc/resolv.conf;

apt install apache2 -y;
apt install libapache2-mod-php7.0 -y;
service apache2 start;

apt install php -y;
php -v;

cp resolv.conf /etc/resolv.conf;
rm resolv.conf;