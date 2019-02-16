#!/bin/sh

# Custom hook script, modified from:
#
## live-config(7) - System Configuration Components
## Copyright (C) 2006-2014 Daniel Baumann <mail@daniel-baumann.ch>
##
## This program comes with ABSOLUTELY NO WARRANTY; for details see COPYING.
## This is free software, and you are welcome to redistribute it
## under certain conditions; see COPYING for details.

set -x


	# Reading kernel command line
	for _PARAMETER in ${LIVE_CONFIG_CMDLINE}
	do
		case "${_PARAMETER}" in
#			live-config.username=*|username=*)
#				LIVE_USERNAME="${_PARAMETER#*username=}"
#				;;
			locales=*)
				LIVE_LANG="${_PARAMETER#*locales=}"
				;;

		esac
	done


if [ -n "$LIVE_LANG" ] ; then
	echo "LIVE_LANG is $LIVE_LANG   @@@@@"

	cat > /etc/profile.d/tt_locale.sh <<EOF
export LANG=${LIVE_LANG}
export LC_ALL=${LIVE_LANG}
EOF
fi
