class ssh {
  $server = true
) {
  if $server {
    include ssh::server
  }
}

# declare with string instead of bool
class { 'ssh':
  server => 'false',
}

# new class definition with validate function
class ssh (
  $server = true,
) {
  validate_bool($server)
  if $server {
    include ssh::server
  }
}
