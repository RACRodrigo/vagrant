define cacti::device (
  $ip,
  $ping_method='icmp'
) {
  $cli = '/usr/share/cacti/cli'
  $base_opt = "--description='${name}' --ip='${ip}'"
  $ping_opt = "--ping_method=${ping_method}"
  $options = "${base_opt} ${ping_opt}"
  $search = "sed 1d | cut -f4- | grep -q '^${name}\$'"
  exec { "add-cacti-device-${name}":
    command => "${cli}/add_device.php ${options}",
    path    => '/bin:/usr/bin',
    unless  => "$cli/add_graphs.php --list-hosts | ${search}",
    require => Class['cacti'],
  }
}
