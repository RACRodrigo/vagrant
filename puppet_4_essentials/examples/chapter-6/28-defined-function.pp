# do not try this!
if defined(File['/etc/motd']) {
  notify { 'This machine has a MotD': }
}

if ! defined(Package['apache2']) {
  package { 'apache2':
    ensure => 'installed',
  }
}

class cacti {
  if ! defined(Package['apache2']) {
    package { 'apache2': ensure => 'present' }
  }
}
class postfixadmin {
  if !defined(Package['apache2'] {
    package { 'apache2': ensure => 'latest' }
  }
}
