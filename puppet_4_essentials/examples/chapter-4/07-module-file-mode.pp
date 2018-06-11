define module_file (
  String $module,
  Optional[String] $mode = undef
) {
  if $mode != undef {
    File { mode => $mode }
  }
  file { $name:
    source => "puppet:///modules/$module/$name"
  }
}
