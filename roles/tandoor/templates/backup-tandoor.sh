#!/bin/sh

BACKUPDIR=/var/lib/tandoor-backups

WORKDIR=$BACKUPDIR/workdir
DATE=$(date '+%Y-%m-%d_%H:%M:%S')

echo "Ensuring backup & workdirs exist"
mkdir -p $WORKDIR

echo "Dumping postgres DB"
docker exec tandoor-tandoor-db-1 pg_dumpall -U tandoor > $WORKDIR/pgdump.sql

echo "Copying static files"
cp -r /usr/local/lib/tandoor/staticfiles $WORKDIR/staticfiles

echo "Copying mediafiles"
cp -r /usr/local/lib/tandoor/mediafiles $WORKDIR/mediafiles

echo "Gzipping all files together"
gzip $BACKUPDIR/$DATE.gzip $WORKDIR/*

echo "Uploading backup archive to remote"
rclone $BACKUPDIR/$DATE.gzip {{ rclone.backup_remote }}:

echo "Cleaning up"
rm -rf $BACKUPDIR
