#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf;

apt install dnsutils -y;
apt install lynx -y;

echo -e "nameserver 192.200.2.2
nameserver 192.200.3.2
nameserver 192.200.3.3
" > /etc/resolv.conf;
