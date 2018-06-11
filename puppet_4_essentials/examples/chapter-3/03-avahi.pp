if $::operatingsystem != 'Ubuntu' {
  package { 'avahi-daemon':
    ensure => absent
  }
}
