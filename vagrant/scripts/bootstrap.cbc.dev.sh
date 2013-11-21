#!/usr/bin/env bash

# Install everything, as root, no prompting
sudo yum -y update
sudo yum -y install httpd
sudo yum -y install postgresql84-server.x86_64
sudo yum -y install php.x86_64
sudo yum -y install subversion
sudo yum -y install ant

# Install git (cf https://gist.github.com/eddarmitage/2001099)
wget http://apt.sw.be/redhat/el5/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
rpm -K rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
rpm -i rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
sudo yum -y install git-gui

# Overwrite default httpd.conf with our custom one.
sudo cp /vagrant/conf/httpd.conf /etc/httpd/conf
