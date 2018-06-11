file { '/etc/sysctl.conf':
  tag => 'security',
}

User<| tag == 'developers' |>
