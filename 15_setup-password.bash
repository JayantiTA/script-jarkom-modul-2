#!/bin/bash

htpasswd -c -b /etc/apache2/.htpasswd Twilight opStrix;

cp 15-strix.operation.wise.f02.com.conf /etc/apache2/sites-available/strix.operation.wise.f02.com.conf;
service apache2 restart;
