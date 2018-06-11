# will work:

case $::operatingsystemmajrelease {
  '8': {
    include base::debian::jessie
  }
}


# will not work:

if $::operatingsystemmajrelease > 7 {
  include base::debian::jessie
}


