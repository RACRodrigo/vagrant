define module_file ( String $module ) {
  file { $name:
    source => "puppet:///modules/${module}/${name}"
  }
}
