#!/bin/bash

echo -e "RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^([^\.]+)$ index.php/$1 [NC,L]
" > /var/www/wise.f02.com/.htaccess;

cp 9-wise.f02.com.conf /etc/apache2/sites-available/wise.f02.com.conf;
a2enmod rewrite;
service apache2 restart;
