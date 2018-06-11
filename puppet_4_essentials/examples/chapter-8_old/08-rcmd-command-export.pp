define rcmd::command (
  $runner,
  $user,
  $id
) {
  file { "/etc/rcmd/${name}.d/${id}":
    ensure  => 'file',
    content => "${user}@${runner}\n";
  }
}

@@rcmd::command { [ 'clear-cache', 'reload-config' ]:
  runner => $::ipaddress,
  user   => hiera('rcmd::user', 'rcmd'),
  id     => $::clientcert,
}
