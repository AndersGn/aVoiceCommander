#!/bin/bash          
	#Add config file to set the USB sound card as default system wide, check if it is at 1 by entering: cat /proc/asound/cards
	echo -e "pcm.!default {\ntype hw\ncard 1\n}\nctl.!default {\ntype hw\ncard 1\n}\n" > /etc/asound.conf
	#Add config file to set default card for pi user
	echo -e "pcm.!default sysdefault:Device" > /home/pi/.asoundrc

