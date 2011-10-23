class nginx::config {
  file {'/etc/nginx/nginx.conf':
    source  => 'puppet:///modules/nginx/nginx.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['nginx::install'],
    notify  => Class['nginx::service'],
  }

  file {'/etc/nginx/conf.d/server_names_hash_bucket_size.conf':
    source  => 'puppet:///modules/nginx/server_names_hash_bucket_size.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['nginx::install'],
    notify  => Class['nginx::service'],
  }
}
