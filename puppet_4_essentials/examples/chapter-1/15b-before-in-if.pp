if $::osfamily == 'Debian' {
  file { '/etc/apt/preferences.d/example.net.prefs':
    ensure  => file,
    content => '_',
    before  => Package['apache2'],
  }
}
package { 'apache2':
  ensure => installed,
}
