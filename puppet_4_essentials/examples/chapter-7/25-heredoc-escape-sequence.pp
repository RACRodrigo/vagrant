$motd_content = @("EOF"/tn)
Welcome to ${::fqdn}.\n\tThis system is managed by Puppet version ${::puppetversion}.\n\tLocal changes will be overwritten by next Puppet run.
EOF


