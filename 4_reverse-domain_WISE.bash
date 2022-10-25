#!/bin/bash

# reverse domain untuk domain utama

# reverse dns
echo -e '
zone "2.200.192.in-addr.arpa" {
    type master;
    file "/etc/bind/wise/2.200.192.in-addr.arpa";
};
' >> /etc/bind/named.conf.local;

echo -e "
;
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
2.200.192.in-addr.arpa. IN      NS      wise.f02.com.
2                       IN      PTR     wise.f02.com.
" > /etc/bind/wise/2.200.192.in-addr.arpa;

service bind9 restart;
