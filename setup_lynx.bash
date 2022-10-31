#!/bin/bash

cp /etc/resolv.conf resolv.conf;
echo nameserver 192.168.122.1 > /etc/resolv.conf;

apt install lynx -y;

cp resolv.conf /etc/resolv.conf;
rm resolv.conf;
