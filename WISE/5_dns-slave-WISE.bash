#!/bin/bash

cp conf-slave /etc/bind/named.conf.local;
service bind9 restart;
