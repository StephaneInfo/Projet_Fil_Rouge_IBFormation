# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
		
		workers=2
	
		config.vm.define "production" do |production|
			production.vm.box = "geerlingguy/centos7"
			production.vm.network "private_network", type: "static", ip: "192.168.99.12"
			production.vm.hostname = "production"
			
			production.vm.provider "virtualbox" do |v|
			  v.name = "production"
			  v.memory = 1024
			  v.cpus = 2
			end
			
			production.vm.provision :shell do |shell|
				shell.path = "install_jenkins.sh"
				shell.args = ["worker", workers]
			end
		end


		config.vm.define "staging" do |staging|
			staging.vm.box = "geerlingguy/centos7"
			staging.vm.network "private_network", type: "static", ip: "192.168.99.11"
			staging.vm.hostname = "staging"
			
			staging.vm.provider "virtualbox" do |v|
			  v.name = "staging"
			  v.memory = 1024
			  v.cpus = 2
			end
			
			staging.vm.provision :shell do |shell|
				shell.path = "install_jenkins.sh"
				shell.args = ["worker", workers]
			end
		end

	
	
	config.vm.define "master" do |master|
		master.vm.box = "geerlingguy/centos7"
		master.vm.network "private_network", type: "static", ip: "192.168.99.10"
		master.vm.hostname = "master"
		
		master.vm.provider "virtualbox" do |v|
		  v.name = "master"
		  v.memory = 2048
		  v.cpus = 2
		end
		
		master.vm.provision :shell do |shell|
			shell.path = "install_jenkins.sh"
			shell.args = ["master", workers]
		end
	end
