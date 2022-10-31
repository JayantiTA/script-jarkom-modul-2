#!/bin/bash

echo -e "
RewriteEngine On
RewriteCond %{REQUEST_URI} ^/public/images/(.*)eden(.*)
RewriteCond %{REQUEST_URI} !/public/images/eden.png
RewriteRule /.* http://eden.wise.f02.com/public/images/eden.png [L]
" > /var/www/eden.wise.f02.com/.htaccess

cp 17-eden.wise.f02.com.conf /etc/apache2/sites-available/eden.wise.f02.com.conf;
cp 17-ports.conf /etc/apache2/ports.conf;
a2enmod rewrite;
service apache2 restart;
