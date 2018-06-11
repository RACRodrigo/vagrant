#!/bin/sh

TITLE="$1"
COMMAND="$2"
KEY=/root/.ssh/id_rsa.rcmd

for REMOTE in `cat /etc/rcmd/${TITLE}.d/*` ; do
    ssh -i $KEY $REMOTE "$COMMAND"
done
