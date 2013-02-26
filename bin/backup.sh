#!/bin/bash

set -ex

BACKUPPREFIX=home
DIR=/home/rohieb/
MOUNTPOINT=/media/truecrypt8
VOLUME='/dev/disk/by-id/usb-ST350083_0AS_611D9FFFFFFF-0:0-part1'

EXCLUDEFILE=~/etc/backup/$BACKUPPREFIX.exclude
DATE=`date +%Y%m%d-%H%M`
BACKUPNAME=$BACKUPPREFIX-$DATE
BACKUPDIR=$MOUNTPOINT/_unfinished.$BACKUPNAME

sudo truecrypt $VOLUME $MOUNTPOINT

RSYNC_OPTS=""
lastbackup=`find $MOUNTPOINT -maxdepth 1 -type d -name "$BACKUPPREFIX"'*' 2>/dev/null | sort | tail -n 1`
if [ -n "$lastbackup" ]; then
	echo hardlinking to last backup in $lastbackup
	RSYNC_OPTS="--link-dest=$lastbackup"
fi;

mkdir -p $BACKUPDIR
rsync --exclude-from=$EXCLUDEFILE $RSYNC_OPTS -av $DIR $BACKUPDIR | tee $MOUNTPOINT/$BACKUPNAME.log

# if this succeeded, remove the .unfinished string from the folder
mv $BACKUPDIR $MOUNTPOINT/$BACKUPNAME

#### OTHER BACKUP LOCATIONS

# FIXME modularize this
mkdir -p $MOUNTPOINT/calrissian
rsync -v 'root@rohieb.name:/var/state/mysql-backup/*.sql.bz2' \
	$MOUNTPOINT/calrissian/

# FIXME detect if disk is full and rotate backups
echo
echo '>>> DISK STATS: <<<'
df -h $MOUNTPOINT

sudo truecrypt -d $MOUNTPOINT

echo Finished. 
echo Log written to $MOUNTPOINT/$BACKUPNAME.log
