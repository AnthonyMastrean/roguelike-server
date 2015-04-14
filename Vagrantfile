VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.define "default" do |node|
    node.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "default.pp"
    end
  end

  config.vm.define "adom" do |node|
    node.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "adom.pp"
    end
  end

  config.vm.define "angband" do |node|
    node.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "angband.pp"
    end
  end
end
