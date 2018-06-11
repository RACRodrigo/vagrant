class cacti ( Boolean $redirect = true ) {
  if $redirect {
    contain cacti::redirect
  }
  package { 'cacti':
    ensure => 'installed'
  }
}
