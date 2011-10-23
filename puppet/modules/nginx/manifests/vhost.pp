define nginx::vhost($ensure, $webmaster='noc@lunix.com.au', $create='yes') {

  case $ensure {
    present: {
      file { "/etc/nginx/sites-available/${name}":
        mode    => '0644',
        require => Class['nginx::config'],
        source  => "puppet:///modules/nginx/sites/${name}",
      }

      file { "/etc/nginx/sites-enabled/${name}":
        ensure  => symlink,
        target  => "/etc/nginx/sites-available/${name}",
        require => File["/etc/nginx/sites-available/${name}" ],
        notify  => Class['nginx::service'],
      }

      if $create == 'yes' {
        file { "/var/www/${name}":
          ensure  => directory,
          mode    => '0775',
          owner   => 'root',
          group   => 'www-data',
          require => Class['nginx::config'],
        }

        file { "/var/www/${name}/htdocs":
          ensure  => directory,
          mode    => '0775',
          owner   => 'root',
          group   => 'www-data',
          require => Class['nginx::config'],
        }

        file { "/var/www/${name}/htdocs/index.html":
          ensure  => file,
          mode    => '0644',
          owner   => 'root',
          group   => 'root',
          content => "Welcom to ${name}\n",
          require => Class['nginx::config'],
        }
      }
    }

    absent: {
      #TODO: remove/archive site directory /var/www/.....

      file {"/etc/nginx/sites-enabled/${name}":
        ensure => absent,
        notify => Class['nginx::service'],
      }

      file {"/etc/nginx/sites-available/${name}":
        ensure  => absent,
      }
    }

    default: {
      fail "Invalid 'ensure' value '${ensure}' for nginx::vhost"
    }
  }
}

