#!/bin/bash
# To use the Wii Controller with raspberry via Bluetooth

# Install bluetooth 
sudo apt-get install --no-install-recommends bluetooth
# Show bluetooth status 
echo "You should see bluetooth is running. If not, reboot and try again."
sudo service bluetooth status

# Install python libraries for wii controller
echo "installing python-cwiid"
sudo apt-get install python-cwiid
