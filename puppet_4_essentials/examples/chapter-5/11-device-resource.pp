# in manifests/nodes.pp
node 'agent' {
  cacti::device { 'Puppet test agent (Debian 7)':
    ip => $::ipaddress;
  }
}
