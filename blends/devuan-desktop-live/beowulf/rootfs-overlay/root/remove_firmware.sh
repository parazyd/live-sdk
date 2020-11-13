#!/usr/bin/env bash
# remove_non-free_firmware


apt-get --purge --yes remove \
	firmware-amd-graphics \
	firmware-atheros \
	firmware-bnx2 \
	firmware-bnx2x \
	firmware-brcm80211 \
	firmware-intelwimax \
	firmware-iwlwifi \
	firmware-libertas \
	firmware-linux-nonfree \
	firmware-misc-nonfree \
	firmware-myricom \
	firmware-netxen \
	firmware-qlogic \
	firmware-ralink \
	firmware-realtek \
	firmware-ti-connectivity \
	firmware-zd1211

apt-get autoremove

exit 0
