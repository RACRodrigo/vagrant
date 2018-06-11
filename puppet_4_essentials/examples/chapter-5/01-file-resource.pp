file { '/etc/ntp.conf':
  ensure => file,
  source => 'puppet:///modules/ntp/ntp.conf',
}
