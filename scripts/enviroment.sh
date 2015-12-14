#!/bin/bash 
echo "set swedish keyboard"
echo -e "# KEYBOARD CONFIGURATION FILE\n# Consult the keyboard(5) manual page.\nXKBMODEL=\"pc105\"\nXKBLAYOUT=\"se\"\nXKBVARIANT=""\nXKBOPTIONS=\"lv3:ralt_switch\"\nBACKSPACE=\"guess\"" > /etc/default/keyboard
echo "set timezone stockholm"
timedatectl set-timezone Europe/Stockholm
echo "change system language to swedish"
locale-gen sv_SE.UTF-8
update-locale LANG=sv_SE.UTF-8
echo "reboot to apply changes"
