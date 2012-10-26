#!/bin/bash

set -ex

BACKUPPREFIX=home
DATE=`date +%Y%m%d-%H%M`
BACKUPNAME=$BACKUPPREFIX-$DATE
DIR=/home/rohieb/
MOUNTPOINT=/media/truecrypt8
VOLUME='/dev/disk/by-id/usb-ST350083_0AS_611D9FFFFFFF-0:0-part1'

truecrypt $VOLUME $MOUNTPOINT

RSYNC_OPTS=""
lastbackup=`find $MOUNTPOINT -type d -name "$BACKUPPREFIX"'*' 2>/dev/null | tail -n 1`
if [ -n "$lastbackup" ]; then
	echo hardlinking to last backup in $lastbackup
	RSYNC_OPTS="--link-dest=$lastbackup"
fi;

mkdir -p $MOUNTPOINT/$BACKUPNAME
rsync $RSYNC_OPTS -av $DIR $MOUNTPOINT/$BACKUPNAME | tee $MOUNTPOINT/$BACKUPNAME.log

# FIXME detect if disk is full and rotate backups

truecrypt -d $MOUNTPOINT
