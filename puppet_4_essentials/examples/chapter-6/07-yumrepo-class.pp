class yumrepos::team_ninja_stable {
  yumrepo { 'team_ninja_stable':
    ensure => present,
    ...
  }
}

include yumrepos::team_ninja_stable
include yumrepos::team_wizard_experimental
package { 'doombunnies': 
  ensure => installed,
  require => Class[
    'yumrepos::team_ninja_stable',
    'yumrepos::team_wizard_experimental'
  ],
}
