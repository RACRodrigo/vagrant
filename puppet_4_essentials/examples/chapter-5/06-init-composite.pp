class cacti( Boolean $redirect = true ) {
  contain cacti::install
  if $redirect {
    contain cacti::redirect
  }
}
