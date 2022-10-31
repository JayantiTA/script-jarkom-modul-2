#!/bin/bash

cp 8-wise.f02.com.conf /etc/apache2/sites-available/wise.f02.com.conf;
mkdir -p /var/www/wise.f02.com;

apt install wget -y;
apt install unzip -y;
wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1S0XhL9ViYN7TyCj2W66BNEXQD2AAAw2e' -O wise.zip;
unzip wise.zip;
mv wise/* /var/www/wise.f02.com;
rm -rf wise;

a2ensite wise.f02.com.conf;
a2dissite 000-default.conf;
service apache2 restart;

echo -e "nameserver 192.200.2.2
nameserver 192.200.3.2
nameserver 192.200.3.3
" > /etc/resolv.conf;
