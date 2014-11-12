# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |vb|
  vb.customize ["modifyvm", :id, "--memory", "1024"]
  end


  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty32"

  # Provisioning script
  config.vm.provision :shell, path: "bootstrap.sh"

  # Set up networking
  config.vm.network :forwarded_port, host: 8080, guest: 80

end
