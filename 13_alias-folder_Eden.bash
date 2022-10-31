#!/bin/bash

cp 13-eden.wise.f02.com.conf /etc/apache2/sites-available/eden.wise.f02.com.conf;
a2enmod rewrite;
service apache2 restart;
