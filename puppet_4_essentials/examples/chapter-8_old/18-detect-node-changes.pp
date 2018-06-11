exec { '/usr/local/sbin/trigger-puppet': refreshonly => true }

resources { 'sshkey': purge => true }

Sshkey<<| |>>       ~> Exec['/usr/local/sbin/trigger-puppet']
Resources['sshkey'] ~> Exec['/usr/local/sbin/trigger-puppet']

