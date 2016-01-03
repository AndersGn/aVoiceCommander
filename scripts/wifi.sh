#!/bin/bash

fileToLookIn="/etc/network/interfaces"

# change from static to dhcp on eth0
if grep -n $fileToLookIn -e "iface eth0 inet manual"
then
    deleteRowNumber=$(grep -n $fileToLookIn -e "iface eth0 inet manual" | cut -d : -f 1)
    sed -i "${deleteRowNumber}d" $fileToLookIn
    deleteRowNumber=$(($deleteRowNumber - 1))
    sed -i "$deleteRowNumber a iface eth0 inet dhcp" $fileToLookIn
    echo "changing to dhcp on eth0 in $fileToLookIn"
fi
# change from static to dhcp on wlan0
if grep -n $fileToLookIn -e "iface wlan0 inet manual"
then
    deleteRowNumber=$(grep -n $fileToLookIn -e "iface wlan0 inet manual" | cut -d : -f 1)
    sed -i "${deleteRowNumber}d" $fileToLookIn
    deleteRowNumber=$(($deleteRowNumber - 1))
    sed -i "$deleteRowNumber a iface wlan0 inet dhcp" $fileToLookIn
    echo "changing to dhcp on wlan0 in $fileToLookIn"
fi
# Check if wlan is set to auto
if grep -n $fileToLookIn -e "auto wlan0"
then
	echo "wlan was allready set to auto"
else
    insertAfterRowNumber=$(grep -n $fileToLookIn -e "allow-hotplug wlan0" | cut -d : -f 1)
    sed -i "$insertAfterRowNumber a auto wlan0" $fileToLookIn
    echo "setting auto on wlan0 in $fileToLookIn"
fi
