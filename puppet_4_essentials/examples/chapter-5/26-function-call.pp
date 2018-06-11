define cacti::device ($ip) { 
  $cli = '/usr/share/cacti/cli'
  $c_ip = cacti_canonical_ip($ip)
  $options = "--description='${name}' --ip='${c_ip}'" 
  exec {  "add-cacti-device-${name}": 
    command => "$cli/add_device.php ${options}", 
    require => Class['cacti'], 
  }
}
