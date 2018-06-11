@@sshkey { $::fqdn:
  host_aliases => $::hostname,
  key          => $::sshecdsakey,
  tag          => 'san-nyc'
}

# import in manifest of peer nodes
Sshkey<<| tag == 'san-nyc' |>>
