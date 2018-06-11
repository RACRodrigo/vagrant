# /etc/puppet/modules/cacti/manifests/init.pp
class cacti {
  package { 'cacti':
    ensure => 'installed'
  }
}
