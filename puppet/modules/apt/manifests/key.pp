define apt::key( $action='add', $keyserver='keyserver.ubuntu.com') {
  case $action {
    add: {
      exec { "aptkey-add-${name}":
        command   => "apt-key adv --keyserver ${keyserver} --recv ${name}",
        logoutput => on_failure,
        unless    => "apt-key list | grep -Fqe '${name}'",
        notify    => Exec['apt-update'];
      }
    }
    del: {
      exec { "apt-key-del-${name}":
        command   => "apt-key del ${name}",
        logoutput => on_failure,
        onlyif    => "apt-key list | grep -Fqe '${name}'",
        notify    => Exec['apt-update'];
      }
    }
    default: {
      notify { "incorrect \$action paramater - ${action}": }
    }
  }
}
