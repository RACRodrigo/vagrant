$default_repos = {
  'doombunnies' => [ 
    'team_ninja_stable',
    'team_wizard_experimental',
  ],
  ...
}

define curated::package (
  $ensure,
  $repositories=[]
) {
  if $ensure != 'absent' {
    if $repositories != [] {
      realize(Yumrepo[$repositories])
    }
    elsif has_key($default_repos,$name) {
      $repolist = $default_repos[$name]
      realize(Yumrepo[$repolist])
    }
  }
  package { $name: ensure => $ensure }
}
