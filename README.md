# Vagrant Endeca VM Guide

This project specifies a Vagrantfile that brings up endeca vms.

## Install Required Software

You need virtualization software and a way to control it.

### Get the latest versions of VirtualBox and Vagrant

- VirtualBox: https://www.virtualbox.org/wiki/Downloads
- Vagrant: http://www.vagrantup.com/downloads.html

### Get the vagrant-vbguest plugin

After installing vagrant:

`vagrant plugin install vagrant-vbguest`

## Check out the code from git:

`$ git clone https://github.com/kpath/Vagrant-Endeca.git`

## Download required third party software

### Endeca 11.1

- Go to [Oracle Edelivery](http://edelivery.oracle.com)
- Accept the restrictions
- On the search page Select the following options: 
  - Product Pack -> ATG Web Commerce
  - Platform -> Linux x86-64
- Click Go
- Click the top search result "Oracle Commerce (11.1.0), Linux"
- Download the following parts:
  - Oracle Commerce MDEX Engine 6.5.1 for Linux
  - Oracle Commerce Content Acquisition System 11.1 for Linux
  - Oracle Commerce Experience Manager Tools and Frameworks 11.1 for Linux
  - Oracle Commerce Guided Search Platform Services 11.1 for Linux

## Create the "endeca11_1" vm

`$ vagrant up endeca11_1` (be patient - it takes a while)

The scripts will:

- start with an empty centos linux box
- convert to oracle linux
- install endeca
- install services for controlling endeca

To get a shell inside the endeca vm:

`$ vagrant ssh endeca`

Key Information:

- The endeca vm has a private ip of 192.168.77.2
- Endeca is installed at `/usr/local/endeca`
- Control endeca services with:
  - `service endecaplatform start|stop`
  - `service endecaworkbench start|stop`
  - `service endecacas start|stop`