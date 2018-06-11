Mysql_grant {
  ensure     => 'present',
  options    => ['GRANT'],
  privileges => ['ALL'],
  tables     => '*.*',
}
mysql_grant { 'root':
  user   => 'root@localhost',
}
mysql_grant { 'apache':
  user   => 'apache@10.0.1.%',
  tables => 'application.*',
}
mysql_grant { 'wordpress':
  user   => 'wordpress@10.0.5.1',
  tables => 'wordpress.*',
}
mysql_grant { 'backup':
  user   => 'backup@localhost',
  privileges => [ 'SELECT', 'LOCK TABLE' ],
}
