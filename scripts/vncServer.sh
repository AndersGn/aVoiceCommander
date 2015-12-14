#!/bin/bash          
	echo Installing tightVNC server on screen number :1
	sudo apt-get -y install tightvncserver
	
	#See to it that the server starts at boot
	mkdir /home/pi/.config/autostart
	echo -e "[Desktop Entry]\nType=Application\nName=TightVNC\nExec=vncserver :1\nStartupNotify=false" > /home/pi/.config/autostart/tightvnc.desktop
	#Set the password
	tightvncserver