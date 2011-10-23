class nginx::config {
  file {'/etc/nginx/nginx.conf':
    source  => 'puppet:///modules/nginx/nginx.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['nginx::install'],
    notify  => Class['nginx::service'],
  }
}
