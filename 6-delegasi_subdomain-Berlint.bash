#!/bin/bash

# buatlah subdomain yang khusus untuk operation yaitu operation.wise.yyy.com
# dengan alias www.operation.wise.yyy.com yang didelegasikan dari WISE ke
# Berlint dengan IP menuju ke Eden dalam folder operation

cp conf-options-delegasi /etc/bind/named.conf.options;

echo -e 'zone "operation.wise.f02.com" {
    type master;
    file "/etc/bind/delegasi/operation.wise.f02.com";
};' >> /etc/bind/named.conf.local;

mkdir /etc/bind/delegasi;
echo -e ";
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     operation.wise.f02.com. root.operation.wise.f02.com. (
                          2022100601         ; Serial
                              604800         ; Refresh
                               86400         ; Retry
                             2419200         ; Expire
                              604800 )       ; Negative Cache TTL
;
@             IN      NS      operation.wise.f02.com.
@             IN      A       192.200.3.3    ; IP EDEN
www           IN      CNAME   operations.wise.f02.com.
" > /etc/bind/delegasi/operation.wise.f02.com;

service bind9 restart;
