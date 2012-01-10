Vagrant::Config.run do |config|
  config.vm.box = "Centos6"
  config.vm.host_name = "graylog2"
  config.vm.forward_port "http", 80, 8000

  config.vm.provision :puppet do |puppet|
   puppet.manifests_path = "manifests"
   puppet.manifest_file  = "site.pp"
   puppet.module_path = "modules"
 end
end
