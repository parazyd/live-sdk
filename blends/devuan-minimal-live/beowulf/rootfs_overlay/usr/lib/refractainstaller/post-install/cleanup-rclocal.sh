#!/bin/sh

sed -i '/dpkg.*ping/d' /target/etc/rc.local

sed -i '/eudev/d' /target/etc/rc.local

exit 0
