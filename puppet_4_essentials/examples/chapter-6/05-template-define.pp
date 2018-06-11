define logrotate::conf (
  String $pattern,
  Integer $max_days=7,
  Array $options=[]
) {
  file { "/etc/logrotate.d/${name}":
    ensure  => file,
    mode    => '0644',
    content => template('logrotate/config-snippet.erb')
  }
}
