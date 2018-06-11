$hash_map = {
  'ben'    => {
    'uid'  => 2203,
    'home' => '/home/ben',
  },
  'jones'  => {
    'uid'  => 2204,
    'home' => '/home/jones',
  }
}

define users::user (
  Integer $uid,
  Pattern[/^\/.*/] $home,
) {
  notify { "User: ${title}, UID: ${uid}, HOME: ${home}": }
}

class users (
  Hash[ String, Hash] $users
) {
  $keys = keys($users)
  each($keys) |String Â$single_key| {
    users::user { $single_key:
      uid  => $users[$single_key]['uid'],
      home => $users[$single_key]['home'],
    }
  }
}

# declaration
class { 'users':
  users => $hash_map,
}
