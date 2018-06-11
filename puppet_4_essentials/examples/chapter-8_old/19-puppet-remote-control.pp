class puppet_remote_control::agent {
  @@rcmd::command { 'trigger-puppet':
    runner => $::ipaddress,
    user   => hiera('rcmd::user', 'rcmd'),
    id     => $::clientcert,
  }
}

class puppet_remote_control::master {
  Rcmd::Command<<| title == 'trigger-puppet' |>>
  file { '/usr/local/sbin/trigger-puppet':
    ensure => 'file',
    mode   => '0755',
    source => 'puppet:///modules/puppet_remote_control/trigger-all-puppet-agents',
  }
}
