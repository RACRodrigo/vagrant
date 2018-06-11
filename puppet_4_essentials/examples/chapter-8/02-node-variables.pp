node 'xndp12-sql09' {
  class { 'site::mysql_server':
    mysql_server_id => '103',
  }
}

class site::mysql_server {
  class {  'mysql': 
    server_id => $mysql_server_id, 
    ...
  }
}
