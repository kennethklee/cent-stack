#!/usr/bin/env bash

source $(dirname $0)/helpers.sh
LOG=/tmp/log/$(basename $0).log
mkdir -p /tmp/log

(
    display Install tools
    (
        sudo yum -y update
        sudo yum -y upgrade
        sudo yum -y install yum-priorities
    ) 2>&1 | indent

    display Install webserver toolchain
    (
        sudo yum -y install httpd
        sudo yum -y install postgresql84-server.x86_64
        sudo yum -y install php.x86_64
        sudo yum -y install subversion
        sudo yum -y install ant
        sudo yum -y install vim-X11 vim-common vim-enhanced vim-minimal
    ) 2>&1 | indent

    display Install git (cf https://gist.github.com/eddarmitage/2001099)
    ()
    wget --quiet http://apt.sw.be/redhat/el5/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
    rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
    rpm -K rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
    rpm -i rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
    sudo yum -y install git-gui

    # Install varnish
    rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el5/noarch/varnish-release/varnish-release-3.0-1.el5.centos.noarch.rpm
    sudo yum -y install varnish

    # Overwrite default httpd.conf with our custom one.
    sudo cp /vagrant/conf/httpd.conf /etc/httpd/conf
    sudo cp /vagrant/conf/default.vcl /etc/varnish

    # run custom install script
    if [ -f /vagrant/scripts/custom.sh ]; then
      sh /vagrant/scripts/custom.sh
    else
      echo "No custom script found"
    fi

) 2>&1 | tee $LOG