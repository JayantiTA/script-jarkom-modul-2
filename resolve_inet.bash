#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf
service bind9 restart;