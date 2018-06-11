service { 'count-logins':
  provider  => 'base',
  ensure    => 'running',
  binary    => '/usr/local/bin/cnt-logins',
  start     => '/usr/local/bin/cnt-logins --daemonize',
  subscribe => File['/usr/local/bin/cnt-logins'],
}
