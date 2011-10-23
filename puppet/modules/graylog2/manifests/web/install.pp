class graylog2::web::install {
  package { 'graylog2-web':
    ensure  => 'present',
    require => [ Class['graylog2::server::service'], Exec['apt-update'], Class['graylog2::common'], ],
  }
  package {'bundler':
    ensure   => 'present',
    provider => 'gem',
    require  => [ Class['graylog2::server::service'], Exec['apt-update'], Class['graylog2::common'], ],
  }
}

