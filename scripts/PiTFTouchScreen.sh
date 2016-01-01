#!/bin/bash          
	echo Adding Adafruit to repositories
	sudo curl -SLs https://apt.adafruit.com/add-pin | sudo bash
	echo intalling PITFT packages
	sudo apt-get install -y raspberrypi-bootloader
	sudo apt-get install -y adafruit-pitft-helper
	echo install 2.8 resitive type
	sudo adafruit-pitft-helper -t 28r

