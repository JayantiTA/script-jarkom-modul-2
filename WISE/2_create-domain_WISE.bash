#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf;
apt update;
apt install -y bind9;

# membuat website utama dengan akses wise.yyy.com
# dengan alias www.wise.yyy.com pada folder wise (2)

# bikin domain
echo -e 'zone "wise.f02.com" {
	type master;
	file "/etc/bind/wise/wise.f02.com";
};' > /etc/bind/named.conf.local;

mkdir -p /etc/bind/wise;
cp /etc/bind/db.local /etc/bind/wise/wise.f02.com;

echo -e ";
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     wise.f02.com. root.wise.f02.com. (
                     2022100601         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      wise.f02.com.
@       IN      A       192.200.2.2    ; IP WISE
www     IN      CNAME   wise.f02.com.
@       IN      AAAA    ::1
" > /etc/bind/wise/wise.f02.com;

service bind9 restart;
