class example_app_config_directories {
  file { [ '/etc/example_app',
           '/etc/example_app/config.d.enabled' ]:
    ensure => 'directory';
  }
}

define example_app_config ( Array $regions = [] ) {
  include example_app_config_directories
  ...
}
