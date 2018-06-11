define curated::package (
  $ensure,
  $repositories=[]
) {
  if $repositories != [] and $ensure != 'absent' {
    realize(Yumrepo[$repositories])
  }
  package { $name: ensure => $ensure }
}

curated::package { 'doombunnies':
  ensure => 'installed',
  repositories => [
    'team_ninja_stable',
    'team_wizard_experimental',
  ],
}
