@@firewall { "150 forward port 443 to ${::hostname}":
  proto       => 'tcp',
  dport       => '443',
  destination => $public_ip_address,
  jump        => 'DNAT',
  todest      => $::ipaddress,
  tag         => 'segment03',
}

# import on the firewall machines
Firewall<<| tag == 'segment03' |>>
