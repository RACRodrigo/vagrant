#!/bin/bash

CONFIG=/etc/puppet/puppet.conf

export PATH=/bin:/usr/bin

if ! grep -q ^certname $CONFIG ; then
    CERT=`cat /proc/sys/kernel/random/uuid`
    echo "certname = $CERT" >>$CONFIG
else
    CERT=`puppet agent --configprint certname`
fi

DIR=`puppet agent --configprint certdir`
[ -f "${DIR}/${CERT}.pem" ] && exit 0

puppet agent --onetime --no-daemonize --waitforcert 300
