# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


  config.vm.define :cobbler do |cobbler_config|
    cobbler_config.vm.box = "precise64"
    cobbler_config.vm.hostname = "cobbler"
    cobbler_config.vm.provider :virtualbox do |vb|
           vb.customize ["modifyvm", :id, "--memory", 1024]
           vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
           vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
    cobbler_config.vm.network :private_network, ip: "192.168.33.10" # eth1 mgt
  end

 
  config.vm.define :pxe1 do |cfg|
    cfg.vm.box = "precise64"
    cfg.vm.hostname = "pxe1"
    cfg.vm.provider :virtualbox do |vb|
           vb.gui = true
            vb.customize ["modifyvm", :id, "--memory", 512]
           vb.customize ["modifyvm", :id, "--boot1", "net"]
           vb.customize ["modifyvm", :id, "--boot2", "disk"]
           vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
           vb.customize ["modifyvm", :id, "--nicbootprio1", 4]
           vb.customize ["modifyvm", :id, "--nicbootprio2", 1]
           vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
    cfg.vm.network :private_network, ip: "192.168.33.11" # eth1 mgt
  end


end
