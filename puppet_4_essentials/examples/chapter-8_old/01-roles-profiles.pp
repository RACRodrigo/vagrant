node falstaff {
  include role::key_distribution_center
}

class role::key_distribution_center {
  include profile::heimdal_server
  include profile::firewall_internal
}

class profile::heimdal_server {
  include heimdal
  class { 'ssh': restricted => true }
}
