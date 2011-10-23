class graylog2::web::common {

  # add key for Mackenzie Morgan repos
  apt::key { '85960EAD':
    action => 'add',
  }

  #add Mackenzie Morgan's repos (for rubygems etc)
    apt::location { 'maco.m':
      action   => 'add',
      location => 'deb http://ppa.launchpad.net/maco.m/ppa/ubuntu lucid main',
    }
}

