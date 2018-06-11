class yumrepos::all {
  @yumrepo { 'team_ninja_stable':
    ensure => present,
    ...,
  }
  @yumrepo { 'team_wizard_experimental': ...
    ...
  }
}

realize(Yumrepo['team_ninja_stable'])
realize(Yumrepo['team_wizard_experimental'])
package { 'doombunnies': 
  ensure => installed,
  require => Yumrepo[
    'team_ninja_stable',
    'team_wizard_experimental'
  ],
}
