#!/bin/bash      
	echo activate the raspberry pi camera
	sudo raspi-config
	echo Installing PiCamera dependencies
	sudo apt-get -y install python-picamera python3-picamera python-rpi.gpio build-essential libavformat-dev libcv2.4 libcvaux2.4 libhighgui2.4 python-opencv opencv-doc libcv-dev libcvaux-dev libhighgui-dev python-numpy
	echo Copying the examples to home/pi/
	cp -r /usr/share/doc/opencv-doc/examples /home/pi/.
