define example_app_config ( Array $regions = [] ) {
  file { "/etc/example_app/conf.d.enabled/${name}":
    ensure => 'link',
    target => "../conf.d.available/${name}",
  }
  example_app_region { $regions:
    country => $name,
  }
}
