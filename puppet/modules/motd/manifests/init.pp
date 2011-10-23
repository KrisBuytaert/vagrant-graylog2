class motd {
  file { '/etc/motd':
    mode    => '0444',
    content => template('motd/motd.erb')
  }
}
