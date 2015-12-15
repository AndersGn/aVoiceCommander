#!/bin/bash          
	#Add config file to set the USB sound card as default system wide, check if it is at 1 by entering: cat /proc/asound/cards
	echo -e "pcm.!default {\ntype hw\ncard 1\n}\nctl.!default {\ntype hw\ncard 1\n}\n" > /etc/asound.conf
	#Add config file to set default card for pi user
	echo -e "pcm.!default sysdefault:Device" > /home/pi/.asoundrc
	echo "if needed unmute the mic with: amixer sset 'Mic',0 unmute"
	echo "Test the sound with: aplay /usr/share/sounds/alsa/Front_Center.wav"
	aplay /usr/share/sounds/alsa/Front_Center.wav	
	#Add config to root (so it will play sound when using sudo)
	echo -e "pcm.!default sysdefault:Device" > /root/.asoundrc
