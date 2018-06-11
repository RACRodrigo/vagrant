class cacti::install {
  # ...
  file { '/usr/share/cacti/cli/remove_device.php':
    mode    => '0755',
    source  => 'puppet:///modules/cacti/usr/share/cacti/cli/remove_device.php',
    require => Package['cacti'],
  }
}
