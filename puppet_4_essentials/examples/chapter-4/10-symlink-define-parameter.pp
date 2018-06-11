define example_app_config (
  Array $regions = []
) {
  file { "/etc/example_app/conf.d.enabled/${name}":
    ensure => 'link',
    target => "../conf.d.available/${name}",
  }
  # to do: add functionality for $regions
}
