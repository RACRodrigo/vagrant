class apache {
  include apache::service
  include apache::package
  include apache::config
}

class apache::service {
  service { 'apache2':
    ensure => 'running',
    enable => true,
  }
}

class apache::package {
  package { 'apache2':
    ensure => 'installed'
  }
}

class apache::config {
  file { '/etc/apache2/apache2.conf':
    source  => '...',
    mode    => '0644',
    notify  => Class['apache::service'],
    require => Class['apache::package'],
  }
}

file { '/etc/apache2/conf.d/passwords.conf':
  source  => '...',
  require => Class['apache'],
}
