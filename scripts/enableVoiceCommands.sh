#!/bin/bash

	#Setup variables
	sphinxbase_version=sphinxbase-5prealpha
	pocketsphinx_version=pocketsphinx-5prealpha
	sphinxtrain_version=sphinxtrain-5prealpha
	sphinxbase_setupfolder="/home/pi/pocketsphinx/$sphinxbase_version"
	pocketsphinx_setupfolder="/home/pi/pocketsphinx/$pocketsphinx_version"
	sphinxtrain_setupfolder="/home/pi/pocketsphinx/$sphinxtrain_version"
       
	#Begin to setup and installing Voice Interfaces
	   
	echo "Add espeak (to get make it speak :-)"
	apt-get install -y espeak
	# Test the voice
	espeak "hello"
	echo "Install voice command software and its dependencies (pocketsphinx)"
	apt-get install -y gcc automake autoconf libtool libasound2-dev bison swig python-dev mplayer
	echo "downloading pocketsphinx 5prealpha and dependencies"
	mkdir /home/pi/pocketsphinx
	wget http://sourceforge.net/projects/cmusphinx/files/sphinxbase/5prealpha/$sphinxbase_version.tar.gz -P /home/pi/pocketsphinx/
	wget http://sourceforge.net/projects/cmusphinx/files/pocketsphinx/5prealpha/$pocketsphinx_version.tar.gz -P /home/pi/pocketsphinx/
	wget http://sourceforge.net/projects/cmusphinx/files/sphinxtrain/5prealpha/$sphinxtrain_version.tar.gz -P /home/pi/pocketsphinx/
	echo "unpack the downloaded files"
	for i in /home/pi/pocketsphinx/*.gz; do tar xzvf $i -C /home/pi/pocketsphinx/;done
	echo "building and install the downloaded programs"
	echo "build sphinxbase and install"
	cd $sphinxbase_setupfolder
	$sphinxbase_setupfolder/autogen.sh
	$sphinxbase_setupfolder/configure
	make -C $sphinxbase_setupfolder/
	sudo make install -C $sphinxbase_setupfolder/
	echo "define paths"
	sed -i '$ a export LD_LIBRARY_PATH=/usr/local/lib' /etc/profile
	sed -i '$ a export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig' /etc/profile
	echo "build pocketsphinx and install"
	cd $pocketsphinx_setupfolder/
	$pocketsphinx_setupfolder/configure
	make -C $pocketsphinx_setupfolder/
	sudo make install -C $pocketsphinx_setupfolder/
	echo "build sphinxstrain"
	cd $sphinxtrain_setupfolder
	$sphinxtrain_setupfolder/configure
	make -C $sphinxtrain_setupfolder/
	sudo make install -C $sphinxtrain_setupfolder/	