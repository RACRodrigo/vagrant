#!/bin/bash

CN=$1
PSK=`cat /path/to/psk`
EXPECT=`echo "$CN$PSK" | sha512sum - | cut -d\  -f1`

HASH=`openssl req -noout -text \
      | grep '1\.3\.6\.1\.4\.1\.34380\.1\.1\.4' \
      | cut -d: -f2 | tr -d ' '`

[[ "$HASH" = "$EXPECT" ]]
