#!/usr/bin/env bash
chown -R webmaster /cbc
sudo chcon -vR --type=httpd_sys_content_t /cbc
