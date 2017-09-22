#!/bin/sh
set -x -e
USER=`ls -lnd /export | awk '{print $4}'`
echo "user:x:$USER:$USER::/export:/bin/false" >> /etc/passwd
diod --foreground --no-auth -l $LISTEN --allsquash --squashuser=user --logdest stderr -e $EXPORT_DIR
