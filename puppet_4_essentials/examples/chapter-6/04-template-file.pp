file { '/etc/apache2/conf.d/cacti.conf':
  content => template('cacti/apache/cacti.conf.erb'),
}
