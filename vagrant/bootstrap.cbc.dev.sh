#!/usr/bin/env bash

# Install everything, as root, no prompting
sudo yum -y update
sudo yum -y install httpd
sudo yum -y install postgresql84-server.x86_64
sudo yum -y install php.x86_64
sudo yum -y install subversion
