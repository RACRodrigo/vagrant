@@haproxy::backend_server { $::clientcert:
  instance => 'my-balanced-service',
  address  => $::ipaddress,
  port     => '3782',
  maxconn  => '24',
}

# collected by loadbalancer nodes:
Haproxy::Backend_server<<| instance == 'my-balanced-service' |>>
