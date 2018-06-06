#!/bin/sh

##
## Remove all the non-free firmware packages
##

FIRMWARE_PKGS="\

atmel-firmware \
bluez-firmware \
dahdi-firmware-nonfree \
firmware-amd-graphics \
firmware-atheros \
firmware-bnx2 \
firmware-bnx2x \
firmware-brcm80211 \
firmware-cavium \
firmware-crystalhd \
firmware-intel-sound \
firmware-intelwimax \
firmware-iwlwifi \
firmware-libertas \
firmware-linux-nonfree \
firmware-myricom \
firmware-netxen \
firmware-qlogic \
firmware-realtek \
firmware-ti-connectivity \
firmware-zd1211 
"

echo "=== removing unwanted firmware packages..."
apt-get autoremove --purge ${FIRMWARE_PKGS}

