define cact::graph($device, $graph = $name) {
  $add = '/usr/local/bin/cacti-add-graph'
  $find = '/usr/local/bin/cacti-find-graph'
  exec { "add-graph-${name}-to-${device}":
    command => "${add} '${device}' '${graph}'",
    path    => '/bin:/usr/bin',
    unless  => "${find} '${device}' '${graph}'",
  }
}
