Vagrant.configure("2") do |config|
# -*- mode: ruby -*-
# vi: set ft=ruby :
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
  config.vm.define "jenkins_c7_0" do |jenkins_c7_0|
    jenkins_c7_0.vm.box = "centos/7"
    jenkins_c7_0.vm.box_check_update = false
    jenkins_c7_0.vm.hostname = "EPUAKHAW2174T50"
    jenkins_c7_0.vm.network "public_network"
    jenkins_c7_0.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", "jenkins_c7_0", "--groups", "/CI_CD"]
      vb.name = "jenkins_c7_0"
      vb.memory = "2048"
    end
    #s_c7_0.vm.provision "cp dhcpd.conf", preserve_order: true, type: "file", source: "dhcpd_c7.conf", destination: "/tmp/dhcpd.conf"
    jenkins_c7_0.vm.provision "docker-compose.yml", preserve_order: true, type: "file", source: "VM1.yml", destination: "/tmp/docker-compose.yml"
    jenkins_c7_0.vm.provision "shell", inline: <<-SHELL
    sudo yum update
    sudo mv -f /tmp/docker-compose.yml /home/vagrant/docker-compose.yml
     #sudo yum install -y epel-release
      sudo curl -fsSL https://get.docker.com/ | sh
      sudo usermod -aG docker vagrant
      sudo systemctl start docker
      sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
      /home/vagrant/docker-compose up

    SHELL
  end

  config.vm.define "vm_c7_0" do |vm_c7_0|
    vm_c7_0.vm.box = "centos/7"
    vm_c7_0.vm.box_check_update = false
    vm_c7_0.vm.hostname = "EPUAKHAW2174T51"
    vm_c7_0.vm.network "public_network"
    vm_c7_0.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", "vm_c7_0", "--groups", "/CI_CD"]
      vb.name = "vm_c7_0"
      vb.memory = "1024"
    end
#    s_c7_0.vm.provider "virtualbox" do |vb|
#        vb.name = "s_c7_0"
#        vb.customize ["modifyvm", :id, "--groups", "/CI_CD"]
#        vb.memory = "1024"
#    end
  #s_c7_0.vm.provision "cp dhcpd.conf", preserve_order: true, type: "file", source: "dhcpd_c7.conf", destination: "/tmp/dhcpd.conf"
    vm_c7_0.vm.provision "shell", inline: <<-SHELL
      sudo yum update
#      sudo yum install -y epel-release
      sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
    SHELL
  end
end
