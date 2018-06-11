define example_app_config {
  file { "/etc/example_app/conf.d.enabled/${name}":
    ensure => 'link',
    target => "../conf.d.available/${name}",
  }
}
