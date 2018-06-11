$resource_hash = hiera('services', {})
create_resources('service', $resource_hash)

$resource_hash.each |$res_title, $attributes| {
  service { $res_title:
    ensure => $attributes['ensure'],
    enable => $attributes['enable'],
  }
}
