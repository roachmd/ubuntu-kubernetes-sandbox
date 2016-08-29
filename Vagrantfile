# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'
require 'open-uri'
require 'tempfile'

Vagrant.require_version ">= 1.7.4"

# Global Variables 
 $vm_box = "bento/ubuntu-14.04"
 $vm_box_master_memory = "4096"
 $vm_box_master_cpus = 4
 $vm_box_minion_memory = "1024"
 $vm_box_minion_cpus = 2
 #Nodes
 $masternode = "10.10.103.250"
 $minion01 = "10.10.103.150"

Vagrant.configure(2) do |config|
  config.vm.box = $vm_box

  config.vm.define vm_name = "masternode" do |masternode|
    masternode.vm.box = $vm_box
    masternode.vm.network "private_network", ip: $masternode
    masternode.vm.hostname = "masternode.kubernetes.local"
    masternode.vm.provision "shell", path: "installDocker.sh"
    masternode.vm.provision "shell", path: "installKubernetes.sh"

   masternode.vm.provider :virtualbox do |vm|
     vm.memory = $vm_box_master_memory
     vm.cpus = $vm_box_master_cpus
   end #end masternode provider
  end #end define masternode
    
#  config.vm.define vm_name = "minion01" do |minion01|
#    minion01.vm.box = $vm_box
#    minion01.vm.network "private_network", ip: $minion01
#    minion01.vm.hostname = "masternode.kubernetes.local"
#    minion01.vm.provision "shell", path: "installDocker.sh"

#   minion01.vm.provider :virtualbox do |vm|
#     vm.memory = $vm_box_minion_memory
#     vm.cpus = $vm_box_minion_cpus
#   end #end minionnode provider
#  end #end define minionnode

end #end configure
