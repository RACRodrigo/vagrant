$search = "sed 1d | cut -f4- | grep -q '^${name}\$'"
exec { "add-cacti-device-${name}":
  command => "${cli}/add_device.php ${options}",
  path    => '/bin:/usr/bin',
  unless  => "${cli}/add_graphs.php --list-hosts | ${search}",
  require => Class['cacti'],
}
