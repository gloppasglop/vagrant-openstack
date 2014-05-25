# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65"
  config.vm.hostname = "openstack.example.com"
  config.vm.network "private_network", ip: "192.168.122.10"

  # config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.network "public_network"
  #

  config.vm.provider "vmware_fusion" do |v|
    # Give enough memory
    v.vmx["memsize"] = "4096"
    # and enough CPUs
    v.vmx["numvcpus"] = "4"
    # Make sure nested virtualization is enabled
    v.vmx["vhv.enable"] = "4"
  end
  config.vm.provision "shell", path: "openstack.sh"
end
