#!/bin/bash

export PATH=/bin:/usr/bin

CERT=`puppet agent --configprint certname`
DIR=`puppet agent --configprint certdir`
[ -f "${DIR}/${CERT}.pem" ] && exit 0

puppet agent --onetime --no-daemonize --waitforcert 300
