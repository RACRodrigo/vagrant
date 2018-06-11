if $::operatingsystem == 'Debian' {
    if versioncmp($::operatingsystemrelease, '7.0') >= 0 {
        $ssh_ecdsa_support = true
    }
}
