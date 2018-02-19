#!/bin/bash
#
# We need a Linux system with root access to create a Singulairy image that has 
# all the needed software preinstalled. If you don't already have root on a Linux 
# system then the easiest approach is to create a virtual machine (VM) running 
# Linux just for creating the Singularity image. 
# A quick way to do this is using "vagrant" and "virtual box". These are tools that 
# are available in both Windows and MacOS environments. 
#
# This script assumes that VirtualBox (https://www.virtualbox.org) and 
# Vagrant (https://www.vagrantup.com) are already installed on your system. It 
# shows how to set up vagrant and a VM to use for building a Singularity image 
# from the root account in the VM. 
#

# Step 3
# 3.1 Install needed software in vagrant VM
# 3.2 Build singularity on vagrant VM

. ./setup-vagrant-parms.sh

# 1.
vagrant ssh -c "sudo apt-get -y update"
vagrant ssh -c "sudo apt-get -y install build-essential"
vagrant ssh -c "sudo apt-get -y install curl git man vim autoconf libtool squashfs-tools"

# 2.
vagrant ssh -c  "git clone https://github.com/singularityware/singularity.git"
vagrant ssh -c  "cd singularity;./autogen.sh"
vagrant ssh -c  "cd singularity;./configure --prefix=/usr/local"
vagrant ssh -c  "cd singularity;make"
vagrant ssh -c  "cd singularity;sudo make install"

