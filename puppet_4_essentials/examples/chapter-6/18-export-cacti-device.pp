@@cacti_device { $::fqdn:
  ensure => present,
  ip  => $::ipaddress,
  tag => 'nyc-site',
}

# collect exports in manifest of cacti server by tag
Cacti_device<<| tag == 'nyc-site' |>>

# or indiscriminately
Cacti_device<<| |>>
