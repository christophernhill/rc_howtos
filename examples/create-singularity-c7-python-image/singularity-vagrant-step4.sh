#!/bin/bash
#
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

# Step 4
# 4.1 Create a config file, called "Singularity", the will be used to 
#     create a container image.
# 4.2 Create a container image based on the config file.
# 4.3 Copy the read-only squashfs form of the container to the host for
#     use as a container image.

. ./setup-vagrant-parms.sh

# 1.
cat <<'EOFA' > Singularity
BootStrap: docker
From: centos:latest

%environment
 export LC_ALL=C

%post
 yum -y update
 yum -y groupinstall 'Development Tools'
 yum -y install bind-utils
 yum -y install infiniband-diags
 yum -y install epel-release
 yum -y install vim
 yum -y install net-tools
 yum -y install nmap-ncat
 yum -y install telnet
 yum -y install python-devel
 yum -y install python-pip
 pip install --upgrade pip
 pip install numpy
 pip install scipy
 pip install scikit-image
 pip install scikit-learn
 pip install scikit-neuralnetwork
 mkdir -p /nobackup1b/users/cnh
 mkdir -p /nfs/cnhlab003/cnh
 mkdir -p /pool001/cnh
 mkdir -p /cm
EOFA

# 2.
vagrant ssh -c "sudo /bin/rm centos7rw.img"
vagrant ssh -c "sudo /bin/rm centos7ro.img"
vagrant ssh -c "sudo /usr/local/bin/singularity image.create --size 2048 centos7rw.img"
vagrant ssh -c "sudo /usr/local/bin/singularity build --writable centos7rw.img /vagrant/Singularity"
vagrant ssh -c "sudo /usr/local/bin/singularity build centos7ro.img centos7rw.img"

# 3.
vagrant ssh -c "sudo cp centos7ro.img /vagrant"
