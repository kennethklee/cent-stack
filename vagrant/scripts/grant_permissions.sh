#!/usr/bin/env bash
sudo chown -R webmaster /cbc
sudo chcon -vR --type=httpd_sys_content_t /cbc
