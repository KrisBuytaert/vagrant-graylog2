class graylog2::server::install {
  package { 'graylog2-server':
    ensure  => 'present',
    require => [ Class['mongo::service'], Exec['apt-update'], Class['graylog2::common'], ],
  }
}

