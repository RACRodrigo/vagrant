define example_app_region( String $country ) {
  file { "/etc/example_app/conf.d.enabled/${country}/regions/${name}",
    ensure => 'link',
    target => "../../regions.available/${name}",
  }
}
