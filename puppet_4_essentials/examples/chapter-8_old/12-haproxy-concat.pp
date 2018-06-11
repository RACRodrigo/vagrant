define haproxy::config (
  $ensure = 'present',
  $globals = [ 'daemon' ],
  $defaults = [ 'timeout connect 10s' ],
  $use_http_mode = true
) {
  concat { "/etc/haproxy/${name}.cfg":
    ensure => $ensure;
  }
  Concat::Fragment { target => "/etc/haproxy/${name}.cfg" }
  concat::fragment { "haproxy-${name}-globals":
    order   => '10',
    content => template('haproxy/cfg-global.erb'),
  }
  concat::fragment { "haproxy-${name}-defaults":
    order   => '20',
    content => template('haproxy/cfg-defaults.erb'),
  }
  concat::fragment { "haproxy-${name}-frontend":
    order   => '30',
    content => template('haproxy/cfg-frontend.erb'),
  }
  concat::fragment { "haproxy-${name}-backend-header":
    order   => '40',
    content => "backend ${name}\n",
  }
}

define haproxy::backend_server (
  $instance,
  $address,
  $port,
  $maxconn
) {
  $line = "server ${name} ${address}:${port} maxconn ${maxconn}"
  concat::fragment { "haproxy-${instance}-backend-${name}":
    target  => "/etc/haproxy/${instance}.cfg",
    order   => '50',
    content => "    ${line}\n",
  }
}
