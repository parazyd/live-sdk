#!/bin/sh

##
## Remove all the non-free firmware packages
##

FIRMWARE_PKGS="\

atmel-firmware \
b43-fwcutter \
bluez-firmware \
dahdi-firmware-nonfree \
firmware-amd-graphics \
firmware-atheros \
firmware-b43-installer \
firmware-b43legacy-installer \
firmware-bnx2 \
firmware-bnx2x \
firmware-brcm80211 \
firmware-cavium \
firmware-crystalhd \
firmware-intel-sound \
firmware-intelwimax \
firmware-ipw2x00 \
firmware-ivtv \
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

