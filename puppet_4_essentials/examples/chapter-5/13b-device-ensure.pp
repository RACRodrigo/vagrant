define cacti::device ($ensure='present', $ip, $ping_method='icmp' ) {
  $cli = '/usr/share/cacti/cli'
  $search = "sed 1d | cut -f4- | grep -q '^${name}\$'"
  case $ensure {
    'present': {
      $base_opt = "--description='${name}' --ip='${ip}'"
      $ping_opt = "--ping_method=${ping_method}"
      $options = "${base_opt} ${ping_opt}"
      exec { "add-cacti-device-${name}":
        command => "${cli}/add_device.php ${options}",
        path    => '/bin:/usr/bin',
        unless  => "$cli/add_graphs.php --list-hosts | ${search}",
        require => Class['cacti'],
      }
    }
    'absent': {
      $remove = "${cli}/remove_device.php"
      $get_id = "${remove} --list-devices | awk -F'\\t' '\$4==\"${name}\" { print \$1 }'"
      exec { "remove-cacti-device-${name}":
        command => "${remove} --device-id=\$( ${get_id} )",
        path    => '/bin:/usr/bin',
        onlyif  => "${cli}/add_graphs.php --list-hosts | ${search}",
        require => Class['cacti'],
      }
    }
  }
}
