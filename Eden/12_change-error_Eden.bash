#!/bin/bash

echo -e "ErrorDocument 404 /error/404.html" > /var/www/eden.wise.f02.com/.htaccess;
service apache2 restart;
