#!/bin/sh

WORKDIR=/var/lib/tandoor-backups

DATE=$(date '+%Y-%m-%d_%H-%M-%S')

echo "Ensuring backup & workdirs exist"
mkdir -p $WORKDIR

echo "Dumping postgres DB"
docker exec tandoor-tandoor-db-1 pg_dumpall -U tandoor > $WORKDIR/pgdump.sql

echo "Copying mediafiles"
cp -r /usr/local/lib/tandoor/mediafiles $WORKDIR/mediafiles

echo "Gzipping all files together"
cd $WORKDIR
tar czvf $DATE.tar.gz ./*

echo "Uploading backup archive to remote"
rclone copy $WORKDIR/$DATE.tar.gz {{ rclone.backups_remote }}:

echo "Cleaning up"
rm -rf $WORKDIR
