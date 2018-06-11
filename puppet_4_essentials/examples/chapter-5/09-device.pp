# .../modules/cacti/manifests/device.pp
define cacti::device ($ip) {
  $cli = '/usr/share/cacti/cli'
  $options = "--description='${name}' --ip='${ip}'"
  exec { "add-cacti-device-${name}":
    command => "${cli}/add_device.php ${options}",
    require => Class['cacti'],
  }
}
