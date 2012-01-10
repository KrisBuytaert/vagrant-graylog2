class unicorn::install {
  package {'rack':
    ensure   => '1.2.2',
    provider => 'gem',
    require  => [ Class['graylog2::server::service'], Class['graylog2::web::common'], ],
  }

  package {'gcc':
    ensure => 'present',
  }

  package {'unicorn':
    ensure   => 'present',
    provider => 'gem',
    require  => [ Class['graylog2::server::service'], Package['rack'], Package['gcc'], ],
  }
}
