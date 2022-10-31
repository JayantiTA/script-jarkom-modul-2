#!/bin/bash

echo -e 'zone "wise.f02.com" {
    type slave;
    masters { 192.200.2.2; };
    file "/var/lib/bind/wise.f02.com";
};' > /etc/bind/named.conf.local;

service bind9 restart;
