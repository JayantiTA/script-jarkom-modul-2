#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf;
apt update;
apt install -y bind9;

echo -e "nameserver 192.200.2.2
nameserver 192.200.3.2
nameserver 192.200.3.3
" > /etc/resolv.conf;
