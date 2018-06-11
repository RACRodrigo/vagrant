#!/bin/sh
/usr/local/sbin/invoke-rcmd trigger-puppet 'sudo puppet agent --test'
