#!/bin/bash

sudo mv files/* /var/www/html
sudo chown root:root /var/www/html/*
sudo chcon -Rv --type=httpd_sys_content_t /var/www/html
sudo chmod 644 /var/www/html/jboss-*
