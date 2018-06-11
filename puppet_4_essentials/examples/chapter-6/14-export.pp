@@file { 'my-app-psk':
  path    => '/etc/my-app/psk',
  content => 'nwNFgzsn9n3sDfnFANfoinaAEF',
  tag     => 'cluster02',
}

# import in the manifest of a remote node
File<<| tag == 'cluster02' |>>
