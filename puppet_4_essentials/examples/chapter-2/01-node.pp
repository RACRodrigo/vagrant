node 'agent' {
  $packages = [
    'apache2', 
    'libapache2-mod-php5', 
    'libapache2-mod-passenger',
  ] 
  package { $packages:
    ensure => 'installed',
    before => Service['apache2'],
  }
  service { 'apache2':
    ensure => 'running',
    enable => true,
  }
}
