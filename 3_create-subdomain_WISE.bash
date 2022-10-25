#!/bin/bash

# membuat subdomain eden.wise.yyy.com dengan alias
# www.eden.wise.yyy.com yang diatur DNS-nya di WISE
# dan mengarah ke Eden

echo -e "nameserver 192.200.2.2
nameserver 192.200.3.3
" > /etc/resolv.conf;

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
eden    IN      A       192.200.3.3    ; IP EDEN
www.eden  IN    CNAME   eden
@       IN      AAAA    ::1
" > /etc/bind/wise/wise.f02.com;

service bind9 restart;
