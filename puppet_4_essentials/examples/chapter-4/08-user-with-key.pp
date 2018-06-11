define user_with_key(
  String $key,
  Optional[String] $uid = undef,
  String $group = 'users'
) {
  if $uid != undef {
    User { uid => $uid }
  }
  user { $title:
    gid        => $group,
    managehome => true,
  }
  ->
  ssh_authorized_key { "key_for_$title":
    ensure => present,
    user   => $title,
    type   => 'rsa',
    key    => $key,
  }
}
