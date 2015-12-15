#!/bin/bash          
	#Add config file to set the USB sound card as default, check if it is at 1 by entering: cat /proc/asound/cards
	echo -e "pcm.!default {\ntype hw\ncard 1\n}\nctl.!default {\ntype hw\ncard 1\n}\n" > /etc/asound.conf
	# if needed unmute the mic with: amixer sset 'Mic',0 unmute