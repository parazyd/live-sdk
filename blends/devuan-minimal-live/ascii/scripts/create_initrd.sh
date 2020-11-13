#!/bin/bash

# ----------------------------------------------------------------------
#
# This file is part of microdevuan, a set of scripts to create minimal 
# devuan live images
# 
# ----------------------------------------------------------------------
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# ----------------------------------------------------------------------
#
# (c) KatolaZ <katolaz@freaknet.org> (2016)
#
# ----------------------------------------------------------------------

####
##
## This will create a minimal initrd without too much garbage
##
## KatolaZ -- 2016-05-14
##
##

if [ $# -le 3 ]; then
	echo "Usage: $0 <initrd_orig> <initrd_new> <initrd_compression> <initrd_micro>"
	exit 1	
fi


####
##
## Config options -- 
##

OLDPWD=`pwd`
INITRD_ORIG=$1
INITRD_NEW=$2
INITRD_COMPR=$3
INITRD_MICRO=$4


WORK_DIR=/tmp/initrd_new


####
##
## unpack the current initrd image
##

if [ ! -d ${WORK_DIR} ]; then
	  mkdir  ${WORK_DIR}
else
    rm -rf ${WORKDIR}/*
fi



####
##
## Determine how the original initrd was compressed...
##

INITRD_FILE=`file -L ${INITRD_ORIG}`

if [ `echo ${INITRD_FILE} | grep gzip | wc -l` == 1 ]; then
    INITRD_UNCOMPRESS=zcat;
elif [ `echo ${INITRD_FILE} | grep bzip2 | wc -l` == 1 ]; then 
    INITRD_UNCOMPRESS=bzcat;
elif [ `echo ${INITRD_FILE} | grep " xz " | wc -l` == 1 ]; then 
    INITRD_UNCOMPRESS=xzcat;
else
    echo "Unable to determine the format of ${INITRD_ORIG} -- Aborting!!!"
    exit 1;
fi

echo -n "===> Uncompressing the original init using ${INITRD_UNCOMPRESS}..."    

cd ${WORK_DIR}; `${INITRD_UNCOMPRESS} ${INITRD_ORIG} | cpio -id` 

echo "done!"

MODULE_DIRS=$(ls lib/modules/)

####
##
## Remove unnecessary ethernet modules -- we already know
## that the root partition is not over nfs...
## 

for M in ${MODULE_DIRS}; do 

	echo "===> Removing drivers for kernel version ${M} <==="

	MODULE_DIR="lib/modules/${M}/kernel"
	
	echo -n "===> Removing unnecessary network drivers..."    

	##rm -rf ${MODULE_DIR}/drivers/net/ethernet/*
	rm -rf ${MODULE_DIR}/drivers/net/*

	echo "done!"
	
	####
	##
	## Remove unnecessary filesystem support
	##
	##
	
	echo -n "===> Removing unnecessary filesystems drivers..."    
	
	##rm -rf ${MODULE_DIR}/fs/nfs
	rm -rf ${MODULE_DIR}/fs/xfs
	rm -rf ${MODULE_DIR}/fs/btrfs
	##rm -rf ${MODULE_DIR}/fs/ext4
	##rm -rf ${MODULE_DIR}/fs/fat
	rm -rf ${MODULE_DIR}/fs/fuse
	rm -rf ${MODULE_DIR}/fs/hfs
	rm -rf ${MODULE_DIR}/fs/hfsplus
	rm -rf ${MODULE_DIR}/fs/reiserfs
	rm -rf ${MODULE_DIR}/fs/ntfs
	rm -rf ${MODULE_DIR}/fs/jfs
	rm -rf ${MODULE_DIR}/fs/jffs2
	rm -rf ${MODULE_DIR}/fs/udf
	##rm -rf ${MODULE_DIR}/fs/nls
	rm -rf ${MODULE_DIR}/fs/nfs_common
	
	echo "done!"
	
	####
	##
	## Remove the lftp and qla2xxx drivers (FibreChannel)
	##
	
	echo -n "===> Removing unnecessary SCSI drivers..."    

	
	rm -rf ${MODULE_DIR}/drivers/scsi/lpfc
	rm -rf ${MODULE_DIR}/drivers/scsi/qla2xxx
	rm -rf ${MODULE_DIR}/drivers/scsi/fnic
	rm -rf ${MODULE_DIR}/drivers/scsi/csiostor
	rm -rf ${MODULE_DIR}/drivers/scsi/isci
	rm -rf ${MODULE_DIR}/drivers/scsi/cxgbi
	rm -rf ${MODULE_DIR}/drivers/scsi/megaraid
	rm -rf ${MODULE_DIR}/drivers/scsi/mpt2sas
	rm -rf ${MODULE_DIR}/drivers/scsi/mpt3sas
	rm -rf ${MODULE_DIR}/drivers/scsi/pm8001
	rm -rf ${MODULE_DIR}/drivers/scsi/qla4xxx
	rm -rf ${MODULE_DIR}/drivers/scsi/aic7xxx
	rm -rf ${MODULE_DIR}/drivers/scsi/bfa

	echo "done!"

	echo -n "===> Removing unnecessary RAID  drivers..."    
	rm -rf ${MODULE_DIR}/drivers/md
	echo "done!"

		
	## remove the gpu driver folder  altogether
	
	echo -n "===> Removing unnecessary GPU drivers..."    
	
	rm -rf ${MODULE_DIR}/drivers/gpu/
	
	echo "done"

	echo -n "===> Removing unnecessary firmware..."    
	
	rm -rf lib/firmware/
	rm -rf ${MODULE_DIR}/firmware/
	#rm -rf ${MODULE_DIR}/firmware/radeon/
	#rm -rf ${MODULE_DIR}/firmware/cxgb4

	echo "done"

	
done

##
## Remove unnecessary stuff in /bin and /sbin
##

echo -n "===> Removing unnecessary stuff in /bin and /sbin..."    

#rm -rf bin/rsync bin/wget
#rm -rf sbin/acpid
#rm -rf lib/systemd

rm sbin/lvm
rm sbin/vgchange
rm sbin/mdadm
rm sbin/mdmon
rm sbin/dmsetup



echo "done!"


####
##
## Maybe we might remove everything in usr/lib
##

echo -n "===> Removing unnecessary libraries in /usr/lib..."    

##rm -rf usr/lib/*

echo "done!"

####


####
##
## Now we create the micro initrd
##

cat <<EOF
*************************************************************************
**  WARNING!!!! DO NOT INTERRUPT THE CREATION OF INITRD OR YOUR IMAGE  **
**  WILL COME OUT COMPLETELY BROKEN (AND YOU MIGHT NEED TO START FROM  **
**  SCRATCH!!!)                                                        **
*************************************************************************
EOF


echo -n "===> Creating new initrd '${INITRD_MICRO}' using ${INITRD_COMPR}..."    

find . | cpio -H newc -o | `echo ${INITRD_COMPR}` > ${INITRD_MICRO}

echo -n "done!"

####
##
## Remove the directory
##

cd ${OLDPWD} && rm -rf ${WORK_DIR}

exit 0
