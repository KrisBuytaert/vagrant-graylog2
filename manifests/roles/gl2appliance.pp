define gl2appliance($webmaster='webmaster@example.com.au') {

  include apt
  include mongo
  include graylog2::common
  include graylog2::server
  include unicorn::install
  include nginx
  include graylog2::web

  #FIXME - scope issue with $name
  nginx::vhost { $name:
    ensure    => 'present',
    webmaster => $webmaster,
    create    => 'no',
  }

  nginx::vhost { 'default':
    ensure => absent,
  }
}
