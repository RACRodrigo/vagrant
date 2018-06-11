class apache {
  package { 'apache2':
    ensure => 'installed',
  }
  file { '/etc/apache2/apache2.conf':
    ensure  => 'file',
    source  => 'puppet:///modules/apache/etc/apache2/apache2.conf',
    require => Package['apache2'],
  }
  service { 'apache2':
    enable    => true,
    subscribe => File['/etc/apache2/apache2.conf'],
  }
}
