class graylog2::common {

  # add key for aussielunix repos
  apt::key { 'D77A4DCC':
    action => 'add',
  }

  #add aussielunix graylog repos
    apt::location { 'aussielunix':
      action   => 'add',
      location => 'deb http://ppa.lunix.com.au/ubuntu/ lucid main',
    }
}
