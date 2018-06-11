class cacti::install {
  include cacti::params
  file {  'remove_device.php': 
    ensure => 'file', 
    path   => "${cacti::params::cli_path}/remove_device.php",
    source => 'puppet:///modules/cacti/cli/remove_device.php', 
    mode   => '0755', 
  }
}
