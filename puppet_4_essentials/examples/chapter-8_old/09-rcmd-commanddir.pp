define rcmd::command_dir() {
  include rcmd::base_dir
  file { "/etc/rcmd/${name}.d":
    ensure => 'directory',
    owner  => 'root',
    mode   => '0644',
    recurse => true,
    purge   => true,
  }
}

rcmd::command_dir { [ 'clear-cache', 'reload-config', ... ]: }
# import peer nodes' configs
Rcmd::Command<<| |>>
# also use own exports
Rcmd::Command<| |>

# the class to make sure that /etc/rcmd exists
class rcmd::base_dir {
  file { '/etc/rcmd': ensure => directory, ... }
}
