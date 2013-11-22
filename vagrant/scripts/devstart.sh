#!/bin/sh

PWD=`pwd`
HOMEFOLDER=/home/`whoami`
ME=`whoami`

if  [ $PWD != $HOMEFOLDER ]; then
	echo "ERROR: Make sure your pwd is set to the root of your home folder ie. $HOMEFOLDER"
	exit 1
fi

if [ ! -d "sites/cbc.ca" ]; then
    mkdir sites/cbc.ca
fi

if [ ! -d "svn/nmui" ]; then
    mkdir svn/nmui
fi

#checkout and install the svn modules from nmui in the home directory
for i in global imagegallery ads stats globalnav homepage news sports breadcrumbnav scripts pluck components regional
do
	svn co https://source.nm.cbc.ca/svn/nmui/$i/trunk $HOMEFOLDER/svn/nmui/$i
	sed -i -e "s|INSTALL_DIR=[a-z/\.]*|INSTALL_DIR=$HOMEFOLDER/sites/cbc.ca|g" $HOMEFOLDER/svn/nmui/$i/conf/custom.conf
	sed -i -e "s|WEBMASTER=[a-z]*|WEBMASTER=$ME|g" $HOMEFOLDER/svn/nmui/$i/conf/custom.conf
	sed -i -e "s|WEBGROUP=[a-z]*|WEBGROUP=cbc|g" $HOMEFOLDER/svn/nmui/$i/conf/custom.conf
	#sed -i -e "s|/home/[a-z]+/|/home/$ME/|g" $HOMEFOLDER/svn/nmui/$i/conf/custom.conf
	cd $HOMEFOLDER/svn/nmui/$i
	sh $HOMEFOLDER/svn/nmui/$i/bin/install.sh custom
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
	sh $HOMEFOLDER/svn/nmsrc/$i/bin/install.sh custom
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
	sh $HOMEFOLDER/svn/nmcg/$i/bin/install.sh custom
	cd $HOMEFOLDER
done

#make regional directories for symlinks
for i in bc calgary edmonton sask manitoba thunderbay sudbury windsor toronto ottawa montreal nb pei ns nl north
do
	if [ ! -d $HOMEFOLDER/sites/cbc.ca/docs/$i ]; then
		mkdir $HOMEFOLDER/sites/cbc.ca/docs/$i
	fi
done

#cd $HOMEFOLDER/sites/cbc.ca/docs/
#GENSL="i/l webcache gfx photos includes/lib/yui includes/flashscripts"
#NEWSSL=" ept network news/includes"
#SPORTSSL=" sports/v11 sports/v12 sports/includes data"
#TVRADIOSL=" radio/includes television/includes/promos pgschedules"
#REGIONSL=" bc/includes calgary/includes edmonton/includes sask/includes manitoba/includes thunderbay/includes sudbury/includes windsor/includes toronto/includes ottawa/includes montreal/includes nb/includes pei/includes ns/includes nl/includes north/includes"
#MEDIASL=" video/js video/embed video/imgs video/css liveradio"
#MISCSL=" deals"
#SYMLINKS=$GENSL$NEWSSL$SPORTSSL$TVRADIOSL$REGIONSL$MEDIASL

#for d in $SYMLINKS
#do
#	if [ -L "$HOMEFOLDER/sites/cbc.ca/docs/$d" ]; then
#		unlink $HOMEFOLDER/sites/cbc.ca/docs/$d
#		echo 'Unlinked symbolic link for '$d
#	fi
#	if [ ! -L "$HOMEFOLDER/sites/cbc.ca/docs/$d" ]; then
#	    ln -s /cbc/content/sites/cbc.ca/docs/$d $HOMEFOLDER/sites/cbc.ca/docs/$d
#	    echo 'Created symbolic link for '$d
#	fi
#done

cd $HOMEFOLDER

echo "Make sure to set the document root of your apache instance to $HOMEFOLDER/sites/cbc.ca/docs"
echo "Done the setup..."
echo "Visit dev71.dev.nm.cbc.ca:port to see your instance running"
