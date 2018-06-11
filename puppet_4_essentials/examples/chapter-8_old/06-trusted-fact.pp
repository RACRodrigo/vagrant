$role = $trusted['extensions']['1.3.6.1.4.1.34380.1.2.42']
node default {
  include "role::${role}"
}
