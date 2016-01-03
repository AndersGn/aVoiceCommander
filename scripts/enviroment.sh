#!/bin/bash
echo "update and install packages"
sudo apt-get update
sudo apt-get install -y emacs
 
#Change the keyboard
echo "set swedish keyboard"
echo -e "# KEYBOARD CONFIGURATION FILE\n# Consult the keyboard(5) manual page.\nXKBMODEL=\"pc105\"\nXKBLAYOUT=\"se\"\nXKBVARIANT=""\nXKBOPTIONS=\"lv3:ralt_switch\"\nBACKSPACE=\"guess\"" > /etc/default/keyboard
#Change the timezone
echo "set timezone stockholm"
timedatectl set-timezone Europe/Stockholm
#Change the default language to swedish
echo "change system language to swedish"
dpkg-reconfigure locales
#Change the hostname
echo "Enter new hostname: "
read input_variable
echo -e $input_variable > /etc/hostname
sudo /etc/init.d/hostname.sh
echo "reboot to apply changes"
	