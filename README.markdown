# graylog2-appliance

This repos is specificly for the building of a graylog2 server.  

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

## Notes

There is two different work flows included with this appliance.  
One makes use of git and puppet and the other rsync and puppet.  
rsync + puppet is great for testing changes to the puppet manifests  
before commiting them to git and deploying to production.  

## Example Development Workflow

    git clone https://aussielunix@bitbucket.org/aussielunix/graylog2-appliance.git  
    ssh-copy-id -i ~/.ssh/lunix_dsa.pub root@dev-vm.local
    cd graylog2-appliance
    cap puppet:prepd HOST="dev-vm.local" (HOST is optional and overrides the default HOST)  
    cap puppet:go HOST="dev-vm.local" OPTIONS="--noop"  
    hack hack hack
    cap upd HOST="dev-vm.local"
    cap puppet:go HOST="dev-vm.local"  
    git commit

## Example Production Workflow

    git clone https://aussielunix@bitbucket.org/aussielunix/graylog2-appliance.git
    ssh-copy-id -i ~/.ssh/lunix_dsa.pub root@example.com.au
    cd graylog2-appliance
    cap puppet:prep HOST="example.com.au" (HOST is optional and overrides the default HOST)
    cap puppet:go HOST="example.com.au" OPTIONS="--noop"
    cap puppet:go HOST="example.com.au"

## TODO


* document document document
* create a wiki page with more info
* write fog script for creating a linode VM
* test with different VM/cloud providers

