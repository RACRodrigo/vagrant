$motd_content = @("EOF")
  Welcome to ${::fqdn}
  This system is managed by Puppet version ${::puppetversion}.
  local changes will be overwritten by next Puppet run.
  | EOF

