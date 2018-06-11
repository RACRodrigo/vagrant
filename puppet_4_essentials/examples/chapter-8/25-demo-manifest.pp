# /etc/puppet/env/production/modules/demo/manifests/init.pp
class demo (
  Boolean $auto = false,
  Boolean $syslog = true,
  String $user = 'nobody'
) {
  file { '/usr/local/bin/demo': ... }
  if $auto {
    cron { 'auto-demo':
      user    => $user,
      command => '/usr/local/bin/demo',
      ...
    }
    $atoms = hiera('demo::atoms', {})
    if $atoms =~Hash[String, Hash] {
      fail "The demo::atoms value must ba a hash of resource descriptions"
    }
    $atoms.each |$title, $attributes| {
      demo::atom { $title:
        address => $attributes['address'],
        port    => $attributes['port'],
      }
    }
  }
}

# /etc/puppet/env/production/modules/demo/manifests/atom.pp
define demo::atom (
  String $address,
  Integer[1,65535] $port=14193
) {
  file { "/etc/demo.d/${name}":
    ensure  => 'file',
    content => "---\nhost: ${address}\nport: ${port}\n",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }
}
