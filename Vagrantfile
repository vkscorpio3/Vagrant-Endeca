# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

ENDECA11_1_PRIVATE_IP = "192.168.77.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :endeca11_1 do |endeca11_1_config|
    endeca11_1_config.vm.box = "chef/centos-6.5"

    # change memory size
    endeca11_1_config.vm.provider "virtualbox" do |v|
      v.memory = 4096
    end

    endeca11_1_config.vm.network "private_network", ip: ENDECA11_1_PRIVATE_IP

    # provision
    endeca11_1_config.vm.provision "shell" do |s|
        s.path = "scripts/endeca11_1/provision.sh"
        s.args = ENV['ENDECA11_1_PROVISION_ARGS']
    end

  end

end
