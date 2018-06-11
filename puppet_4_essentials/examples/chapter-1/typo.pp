file { '/etc/haproxy/haproxy.cfg':
  owner  => 'root',
  group  => 'root',
  mode   => '644',
  source => 'puppet:///modules/haproxy/etc/haproxy.cfg'
}

service { 'haproxy':
  ensure => 'running',
  require => [
    File['/etc/haproxy/haproxy.cfg'],
  ],
}
