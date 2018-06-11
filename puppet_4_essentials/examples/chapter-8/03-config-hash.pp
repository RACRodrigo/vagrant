$mysql_config_table = {
  'xndp12-sql01' => {
    server_id   => '1',
    buffer_pool => '12G',
  },
  ...
}

class site::mysql_server ( $config = $mysql_config_table[$::certname] ) {
  class { 'mysql':
    server_id => $config['server_id'],
    ...
  }
}
