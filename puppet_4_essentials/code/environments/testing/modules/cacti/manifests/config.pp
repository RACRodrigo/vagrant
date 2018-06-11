class cacti::config {

    file { '/etc/apache2/conf.d/cacti.conf':
        mode => '0644',
        source => '/usr/share/cacti/conf_templates/cacti.apache.conf',
    }

}
