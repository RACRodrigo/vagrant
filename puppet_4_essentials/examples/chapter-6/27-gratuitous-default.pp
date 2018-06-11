class webserver {
  include apache, nginx, firewall, logging_client
  File { owner => 'www-data' }
  file {
    ...
  }
}

# effected resource:
file { '/etc/motd': content => '...' }

# overwriting the default
File { owner => undef }

# overwrite single resource
file { '/etc/motd': content => '...', owner => undef }
