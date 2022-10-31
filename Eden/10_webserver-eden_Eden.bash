#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf;

cp 10-eden.wise.f02.com.conf /etc/apache2/sites-available/eden.wise.f02.com.conf;
mkdir -p /var/www/eden.wise.f02.com;

wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1q9g6nM85bW5T9f5yoyXtDqonUKKCHOTV' -O eden_wise.zip;
unzip eden_wise.zip;
mv eden.wise/* /var/www/eden.wise.f02.com;
rm -rf eden_wise;

a2ensite eden.wise.f02.com.conf;
a2dissite wise.f02.com.conf;
service apache2 restart;

echo -e "nameserver 192.200.2.2
nameserver 192.200.3.2
nameserver 192.200.3.3
" > /etc/resolv.conf;
