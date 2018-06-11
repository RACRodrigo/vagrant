# in module "mysql"
class mysql {
 ...
}

# in module "application"
class application::mysq {
  # works in Puppet 2,3,4
  include ::mysql
  # only works in Puppet 4
  include mysql
}
