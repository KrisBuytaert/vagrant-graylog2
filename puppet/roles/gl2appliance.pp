class gl2appliance {
  include apt, mongo, graylog2::common, graylog2::server, unicorn::install, graylog2::web 
}
