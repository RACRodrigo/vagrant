class profile::heimdal_server {
  include heimdal
  class { 'ssh': restricted => true }
}
