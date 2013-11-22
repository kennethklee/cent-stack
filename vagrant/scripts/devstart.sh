#!/usr/bin/env bash

PWD=`pwd`
HOMEFOLDER=/vagrant
ME=`whoami`

#checkout and install the svn modules from nmui in the home directory
for i in global imagegallery ads stats globalnav homepage news sports breadcrumbnav scripts pluck components regional
do
	svn co https://source.nm.cbc.ca/svn/nmui/$i/trunk $HOMEFOLDER/svn/nmui/$i
	#sed -i -e "s|INSTALL_DIR=[a-z/\.]*|INSTALL_DIR=$HOMEFOLDER/sites/cbc.ca|g" $HOMEFOLDER/svn/nmui/$i/conf/custom.conf
	#sed -i -e "s|WEBMASTER=[a-z]*|WEBMASTER=$ME|g" $HOMEFOLDER/svn/nmui/$i/conf/custom.conf
	#sed -i -e "s|WEBGROUP=[a-z]*|WEBGROUP=cbc|g" $HOMEFOLDER/svn/nmui/$i/conf/custom.conf
	#sed -i -e "s|/home/[a-z]+/|/home/$ME/|g" $HOMEFOLDER/svn/nmui/$i/conf/custom.conf
	cd $HOMEFOLDER/svn/nmui/$i
	sudo -u webmaster sh $HOMEFOLDER/svn/nmui/$i/bin/install.sh dev
	cd $HOMEFOLDER
done

#checkout and install the svn modules from nmsrc in the home directory
for i in comboloader
do
	svn co https://source.nm.cbc.ca/svn/nmsrc/$i/trunk $HOMEFOLDER/svn/nmsrc/$i
	sed -i -e "s|INSTALL_DIR=[a-z/\.]*|INSTALL_DIR=$HOMEFOLDER/sites/cbc.ca|g" $HOMEFOLDER/svn/nmsrc/$i/conf/custom.conf
	sed -i -e "s|WEBMASTER=[a-z]*|WEBMASTER=$ME|g" $HOMEFOLDER/svn/nmsrc/$i/conf/custom.conf
	sed -i -e "s|WEBGROUP=[a-z]*|WEBGROUP=cbc|g" $HOMEFOLDER/svn/nmsrc/$i/conf/custom.conf
	cd $HOMEFOLDER/svn/nmsrc/$i
	sudo -u webmaster sh $HOMEFOLDER/svn/nmsrc/$i/bin/install.sh custom
	cd $HOMEFOLDER
done

#checkout and install the svn modules from nmcg in the home directory
for i in radioportal tvportal
do
	svn co https://source.nm.cbc.ca/svn/nmcg/$i/trunk $HOMEFOLDER/svn/nmcg/$i
	sed -i -e "s|INSTALL_DIR=[a-z/\.]*|INSTALL_DIR=$HOMEFOLDER/sites/cbc.ca|g" $HOMEFOLDER/svn/nmcg/$i/conf/custom.conf
	sed -i -e "s|WEBMASTER=[a-z]*|WEBMASTER=$ME|g" $HOMEFOLDER/svn/nmcg/$i/conf/custom.conf
	sed -i -e "s|WEBGROUP=[a-z]*|WEBGROUP=cbc|g" $HOMEFOLDER/svn/nmcg/$i/conf/custom.conf
	cd $HOMEFOLDER/svn/nmcg/$i
	sudo -u webmaster sh $HOMEFOLDER/svn/nmcg/$i/bin/install.sh custom
	cd $HOMEFOLDER
done

#make regional directories for symlinks
for i in bc calgary edmonton sask manitoba thunderbay sudbury windsor toronto ottawa montreal nb pei ns nl north
do
	if [ ! -d $HOMEFOLDER/sites/cbc.ca/docs/$i ]; then
		mkdir $HOMEFOLDER/sites/cbc.ca/docs/$i
	fi
done
