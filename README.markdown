# graylog2-appliance

This is an appliance stack for simplyfying the building of a central logging  
server based on Graylog2.  
Currently this will install everything needed and leave you with a working Graylog2  
server ready for connections, with the web UI on port 8080.  
The appliance will take around 20 or so minutes to build depending on the speed  
of your VM and the internet connection.  

## In here you will find:  

* a collection of puppet(2.7) manifests and modules  
* a capistrano recipe for orchestration  

## Pre-requisites

The following pre-requisites should be met to be able to use this appliance.  

* a clean/fresh minimal Ubuntu Lucid VM
* root access to the VM (can be disabled when appliance is built)  
* ssh keys deployed and ssh-agent forwarding turned on.
* capistrano installed locally
  * gem install capistrano (if needed)

## Workflows / Usage

There is two different work flows included with this appliance.  
One makes use of git + puppet and the other rsync + puppet.  
rsync + puppet is great for testing changes to the puppet manifests  
before commiting them to git and deploying to production.  

## Example Development Workflow

    git clone https://bitbucket.org/aussielunix/graylog2-appliance.git  
    ssh-copy-id -i ~/.ssh/lunix_dsa.pub root@dev-vm.local
    cd graylog2-appliance
    cap puppet:prepd HOST="dev-vm.local" (HOST is optional and overrides the default HOST)  
    cap puppet:go HOST="dev-vm.local" OPTIONS="--noop"  
    hack hack hack
    cap puppet:upd HOST="dev-vm.local" #rsyncs changes to VM
    cap puppet:go HOST="dev-vm.local"  
    git commit

## Example Production Workflow

    git clone https://bitbucket.org/aussielunix/graylog2-appliance.git
    ssh-copy-id -i ~/.ssh/lunix_dsa.pub root@example.com.au
    cd graylog2-appliance
    cap puppet:prep HOST="example.com.au" #git clone + install puppet etc
    cap puppet:go HOST="example.com.au" OPTIONS="--noop"
    cap puppet:go HOST="example.com.au"
    cap puppet:up HOST="example.com.au" # pulls down changes from git
    cap puppet:go HOST="example.com.au"

## TODO

* document document document
* create a wiki page with more info
* write fog script for creating a linode VM
* test with different VM/cloud providers
* add smoke tests to modules
* cucumber tests to test appliance has built correctly.
