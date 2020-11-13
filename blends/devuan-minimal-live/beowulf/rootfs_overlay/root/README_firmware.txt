== About non-free firmware in Devuan minimal-live

Devuan minimal live comes with all the available firmware
packages pre-installed. This means that also *non-free* 
software is present in this image. Actually, those non-free 
firmware packages are *the only* non-free software packages
installed in this image. 

This choice was dictated by the necessity to facilitate 
new users in getting their hardware, and expecially wifi 
cards, working out of the box. 

However, we highly value the freedom of Devuan users, and 
we would rather prefer to not be ever forced to use non-free
software, at all. 

For this reason, we provide a simple script, called 
"remove_firmware.sh", which allows to remove all non-free 
firmware from your installation right after boot. Just run 
the script, and all non-free firmware will be removed. 
