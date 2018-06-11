define logrotate::config(
  integer $rotations = hiera('logrotate::rotations', 7)
) {
  # regular define code here
}

# overwrites Hiera data:
logrotate::config { '/var/log/cacti.log': rotations => 12 }
