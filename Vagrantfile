VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.define "default" do |node|
    node.vm.synced_folder "downloads", "/tmp/downloads"
    node.vm.synced_folder "packages", "/tmp/packages"
    node.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "default.pp"
      puppet.module_path = "modules"
    end
  end

  config.vm.define "server" do |node|
    node.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "server.pp"
      puppet.module_path = "modules"
    end
  end
end
