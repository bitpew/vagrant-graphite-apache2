Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.name = "graphite-apache2"
    v.memory = "512"
  end

  config.vm.provision :shell, path: "provisioning/bootstrap.sh", privileged: false

  config.vm.network "forwarded_port", guest: 2003, host: 22003 # carbon-cache
  config.vm.network "forwarded_port", guest: 8000, host: 28000 # graphite-web
end