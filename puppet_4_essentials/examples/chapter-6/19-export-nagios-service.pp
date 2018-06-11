class site::ssh {
  # ...actual SSH management...
  @@nagios_service { "${fqdn}-ssh":
    use       => 'ssh_template',
    host_name => $::fqdn,
  }
}

# import on the Nagios node
Nagios_service<<| |>>
