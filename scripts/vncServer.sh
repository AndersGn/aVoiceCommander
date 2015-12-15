#!/bin/bash          
	echo Installing tightVNC server on screen number :1
	sudo apt-get -y install tightvncserver
	
	#See to it that the server starts at boot
	sudo -i -u pi mkdir /home/pi/.config/autostart
	sudo -i -u pi echo -e "[Desktop Entry]\nType=Application\nName=TightVNC\nExec=vncserver :1\nStartupNotify=false" > /home/pi/.config/autostart/tightvnc.desktop
	#Set the password (as the pi user)
	sudo -i -u pi tightvncserver