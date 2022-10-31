#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf;

cp 14-strix.operation.wise.f02.com.conf /etc/apache2/sites-available/strix.operation.wise.f02.com.conf;
cp 14-ports.conf /etc/apache2/ports.conf;
mkdir -p /var/www/strix.operation.wise.f02.com;

wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1bgd3B6VtDtVv2ouqyM8wLyZGzK5C9maT' -O strix_operation.zip;
unzip strix_operation.zip;
mv strix.operation.wise/* /var/www/strix.operation.wise.f02.com;
rm -rf strix.operation.wise;

a2ensite strix.operation.wise.f02.com.conf;
service apache2 restart;

echo -e "nameserver 192.200.2.2
nameserver 192.200.3.2
nameserver 192.200.3.3
" > /etc/resolv.conf;
