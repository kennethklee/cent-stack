#!/usr/bin/env bash
sudo /usr/sbin/apachectl -f /etc/httpd/conf/httpd.conf
sudo /sbin/service varnish start
