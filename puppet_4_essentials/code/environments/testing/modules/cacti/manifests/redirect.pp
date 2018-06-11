class cacti::redirect {

    file { '/etc/apache2/conf-available/cacti-redirect.conf':
        ensure => file,
        source => 'puppet:///modules/cacti/etc/apache2/conf.d/cacti-redirect.conf',
        require => Package['cacti'],
    }

    file { '/etc/apache2/conf-enabled/cacti-redirect.conf':
        ensure => link,
        target => '/etc/apache2/conf-available/cacti-redirect.conf',
    }

}
