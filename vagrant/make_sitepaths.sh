#!/usr/bin/env bash
mkdir -p /cbc/content/sites/cbc.ca/docs/i/tests
chown webmaster /cbc/content/sites/cbc.ca/docs/i/tests
sudo chcon -vR --type=httpd_sys_content_t /cbc
ln -s /cbc /var/www/html/cbc
