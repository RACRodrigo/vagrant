# .../modules/cacti/manifests/install.pp
class cacti::install {
  package { 'cacti':
    ensure => 'installed'
  }
}
