$plugins = hiera('reporting::plugins')
$plugins = hiera('reporting::plugins', [])
$plugins = hiera('reporting::plugins', [], 'global-overrides')

@@cacti_device { $::fqdn:
  ip => hiera('snmp_address', $::ipaddress),
}
