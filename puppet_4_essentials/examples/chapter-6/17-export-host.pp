@@host { $::fqdn:
  ip           => $::ipaddress,
  host_aliases => [ $::hostname ],
  tag          => 'nyc-site',
}

# import all peer hosts
Host<<| tag == 'nyc-site' |>>
