define apt::location ( $location, $action = 'add' ) {
  case $action {
    add: {
      file { "/etc/apt/sources.list.d/${name}.list":
        ensure  => present,
        content => $location,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        notify  => Exec['apt-update'];
      }
    }
    del: {
      file { "/etc/apt/sources.list.d/${name}":
        ensure => absent,
      }
    }
    default: {
      notify {"${action} is not a valid action.": }
    }
  }
}
