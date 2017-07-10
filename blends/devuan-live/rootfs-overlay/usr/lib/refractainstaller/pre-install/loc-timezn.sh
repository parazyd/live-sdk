#!/usr/bin/env bash
# loc-timezn.sh


# Send errors to the installer's error log.
error_log=$(grep error_log /etc/refractainstaller.conf | cut -d"\"" -f2)
exec 2>> "$error_log"


# comment all locales in locale.gen
sed -i '/^[a-z][a-z]_/s/^/# /' /etc/locale.gen

# find the current active locale and uncomment it
CURRENT_LOCALE=$(grep -v ^\# /etc/default/locale | cut -d= -f2)
if [[ -n "$CURRENT_LOCALE" ]] ; then
	sed -i "s/# $CURRENT_LOCALE/$CURRENT_LOCALE/" /etc/locale.gen
fi

# This lets you choose time zone and locale (language) at the beginning
# of the installation process. Un-comment the keyboard-configuration
# if you want that to run, too.
# GUI falls back to terminal automatically on failure. 

if  [[ $DISPLAY ]] ; then
	dpkg-reconfigure -fgnome tzdata
	dpkg-reconfigure -fgnome locales
	dpkg-reconfigure -fgnome keyboard-configuration
	dpkg-reconfigure -fgnome popularity-contest
else
	echo -e "\n\tSet time zone and locales.\n"
	sleep 2
	dpkg-reconfigure tzdata
	dpkg-reconfigure locales
	dpkg-reconfigure keyboard-configuration
	dpkg-reconfigure popularity-contest
fi




exit 0
