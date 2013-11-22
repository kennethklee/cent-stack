#!/usr/bin/env bash
mkdir -p /cbc/content/sites/cbc.ca/docs/g/i
mkdir -p /cbc/content/sites/cbc.ca/docs/g/e
mkdir -p /cbc/content/sites/cbc.ca/docs/i/tests
mkdir -p /cbc/content/sites/cbc.ca/docs/i/o/globalnav/v10/css
mkdir -p /cbc/content/sites/cbc.ca/docs/i/o/globalnav/v10/gfx
mkdir -p /cbc/content/sites/cbc.ca/docs/i/o/globalnav/v10/ext
mkdir -p /cbc/content/sites/cbc.ca/docs/i/o/globalnav/v10/xsl
chown -R webmaster /cbc
sudo chcon -vR --type=httpd_sys_content_t /cbc
rm -rf /var/www/html
ln -s /cbc/content/sites/cbc.ca/docs /var/www/html
