#!/bin/bash

# buatlah subdomain melalui Berlint dengan akses strix.operation.wise.yyy.com
# dengan alias www.strix.operation.wise.yyy.com yang mengarah ke Eden

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
www           IN      CNAME   operation.wise.f02.com.
strix         IN      A       192.200.3.3    ; IP EDEN
www.strix     IN      CNAME   strix
" > /etc/bind/delegasi/operation.wise.f02.com;

service bind9 restart;
