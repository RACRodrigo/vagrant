file { '/root/.ssh/id_rsa.rcmd':
  owner  => 'root',
  mode   => '0600',
  source => 'puppet:///modules/rcmd/root/.ssh/id_rsa.rcmd',
}

ssh_authorized_key { 'rcmd-key':
  ensure => 'present',
  type   => 'rsa',
  user   => hiera('rcmd::user'),
  key    => hiera('rcmd::public_key'),
}
