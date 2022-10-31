#!/bin/bash

cp 16-000-default.conf /etc/apache2/sites-available/000-default.conf;
service apache2 restart;
