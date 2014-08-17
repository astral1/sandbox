# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
API_VERSION = '2'

Vagrant.configure(API_VERSION) do |config|
  config.vm.box = 'astral1/trusty64'

  config.vm.synced_folder 'provision/states/', '/srv/salt/'

  config.vm.define :vbox1 do |v1|
    v1.vm.hostname = 'vbox1'
    v1.vm.network 'private_network', ip: '172.16.33.10'
  end

  config.vm.define :vbox2 do |v2|
    v2.vm.hostname = 'vbox2'
    v2.vm.network 'private_network', ip: '172.16.33.11'
  end

  config.vm.provision :salt do |salt|
    salt.minion_config = 'provision/config'
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = true
    salt.log_level = 'warning'
  end
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
