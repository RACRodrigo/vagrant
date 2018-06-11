node 'falstaff.example-net' {
  include role::key_distribution_center
}

class role::key_distribution_center {
  include profile::heimdal_server
  include profile::firewall_internal
}

