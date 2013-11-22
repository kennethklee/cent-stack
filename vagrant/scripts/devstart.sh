#!/usr/bin/env bash

PWD=`pwd`
HOMEFOLDER=/vagrant
ME=`whoami`

#checkout and install the svn modules from nmui in the home directory
for i in global imagegallery ads stats globalnav homepage news sports breadcrumbnav scripts pluck components regional
do
	svn co https://source.nm.cbc.ca/svn/nmui/$i/trunk $HOMEFOLDER/svn/nmui/$i
	cd $HOMEFOLDER/svn/nmui/$i
	sudo -u webmaster sh $HOMEFOLDER/svn/nmui/$i/bin/install.sh dev
	cd $HOMEFOLDER
done

#checkout and install the svn modules from nmsrc in the home directory
for i in comboloader
do
	svn co https://source.nm.cbc.ca/svn/nmsrc/$i/trunk $HOMEFOLDER/svn/nmsrc/$i
	cd $HOMEFOLDER/svn/nmsrc/$i
	sudo -u webmaster sh $HOMEFOLDER/svn/nmsrc/$i/bin/install.sh dev
	cd $HOMEFOLDER
done

#checkout and install the svn modules from nmcg in the home directory
for i in radioportal tvportal
do
	svn co https://source.nm.cbc.ca/svn/nmcg/$i/trunk $HOMEFOLDER/svn/nmcg/$i
	cd $HOMEFOLDER/svn/nmcg/$i
	sudo -u webmaster sh $HOMEFOLDER/svn/nmcg/$i/bin/install.sh dev
	cd $HOMEFOLDER
done
