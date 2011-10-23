#!/usr/bin/env ruby

set :user, 'root'
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

host = ENV['HOST']
host ||= 'graylog2-dev-01'


namespace :puppet do

  desc "prep dev server via rsync"
  task :prepd, :hosts => host do
    options = ENV['options'] || ENV['OPTIONS']
    run "apt-get install python-software-properties"
    run "add-apt-repository ppa:maco.m/ruby"
    run "apt-get update"
    run "apt-get install -qy ruby rubygems libshadow-ruby1.8 git-core libruby-extras"
    run "groupadd -r puppet && useradd -r -M -g puppet puppet"
    run "gem install puppet --no-rdoc --no-ri"
    `rsync -avz --delete -e ssh . #{user}@#{host}:/opt/build`
  end

  desc "prep server for puppet run - git clone etc"
  task :prep, :hosts => host do
    options = ENV['options'] || ENV['OPTIONS']
    run "apt-get install python-software-properties"
    run "add-apt-repository ppa:maco.m/ruby"
    run "apt-get update"
    run "apt-get install -qy ruby rubygems libshadow-ruby1.8 git-core libruby-extras"
    run "groupadd -r puppet && useradd -r -M -g puppet puppet"
    run "gem install puppet --no-rdoc --no-ri"
    run "git clone git@bitbucket.org:aussielunix/graylog2-appliance.git /opt/build"
  end

  desc "update puppet repos on dev server - rsync"
  task :upd, :hosts => host do
    options = ENV['options'] || ENV['OPTIONS']
    `rsync -avz --delete -e ssh . #{user}@#{host}:/opt/build`
  end

  desc "update puppet repos from bitbucket"
  task :up, :hosts => host do
    options = ENV['options'] || ENV['OPTIONS']
    run "cd /opt/build && git pull"
  end

  desc "runs puppet apply on remote host - Params:  HOST OPTIONS"
  task :go, :hosts => host do
    options = ENV['options'] || ENV['OPTIONS']
    run "/var/lib/gems/1.8/bin/puppet apply --verbose /opt/build/puppet/init.pp --modulepath=/opt/build/puppet/modules #{options}"
  end

end

