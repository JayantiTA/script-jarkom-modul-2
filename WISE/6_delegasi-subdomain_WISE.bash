#!/bin/bash

# buatlah subdomain yang khusus untuk operation yaitu operation.wise.yyy.com
# dengan alias www.operation.wise.yyy.com yang didelegasikan dari WISE ke
# Berlint dengan IP menuju ke Eden dalam folder operation

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
@             IN    NS      wise.f02.com.
@             IN    A       192.200.2.2    ; IP WISE
www           IN    CNAME   wise.f02.com.
eden          IN    A       192.200.3.3    ; IP EDEN
www.eden      IN    CNAME   eden
ns1           IN    A       192.200.3.3    ; IP EDEN
operation     IN    NS      ns1
@             IN    AAAA    ::1
" > /etc/bind/wise/wise.f02.com;

cp conf-options-delegasi /etc/bind/named.conf.options;

service bind9 restart;
