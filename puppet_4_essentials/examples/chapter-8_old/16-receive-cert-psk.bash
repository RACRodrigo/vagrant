#!/bin/bash

PSKFILE=/path/to/psk
CONFIG=/etc/puppet/puppet.conf
ATTRIBUTES=/etc/puppet/csr_attributes.yaml

export PATH=/bin:/usr/bin

if ! grep -q ^certname $CONFIG ; then
    CERT=`cat /proc/sys/kernel/random/uuid`
    echo "certname = $CERT" >>$CONFIG
else
    CERT=`puppet agent --configprint certname`
fi

DIR=`puppet agent --configprint certdir`
[ -f "${DIR}/${CERT}.pem" ] && exit 0

PSK=`cat $PSKFILE`
HASH=`echo "$CERT$PSK" | sha512sum - | cut -d\  -f1`

sed -i s/__HASHED_PSK__/$HASH/ $ATTRIBUTES

puppet agent --onetime --no-daemonize --waitforcert 10

rm $PSKFILE
