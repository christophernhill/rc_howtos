#!/bin/bash
#
# We need a Linux system with root access to create a Singulairy image that has all the needed
# software preinstalled. If you don't already have root on a Linux system then the easiest
# approach is to create a virtual machine (VM) running Linux just for creating the Singularity image. 
# A quick way to do this is using "vagrant" and "virtual box". These are tools that are
# avialble in both Windows and MacOS environments. 
#
# This script assumes that VirtualBox (https://www.virtualbox.org) and Vagrant (https://www.vagrantup.com)
# are already installed on your system. It shows how to set up vagrant and a VM to use for building
# a Singularity image from the root account in the VM. 
#

# Switch to some working directory - can be changed as needed
WDIR="./singularity-build-dir"
mkdir -p ${WDIR}
cd ${WDIR}
CURDIR=`pwd`

# 1. Create config file to ensure VM has reasonable memory
#    (default Vagrant is 512MB, which is too small for some Python 
#    (package compile stages. Here we create commands to edit config 
#    (for 4GB and 4 virtual cpu cores.
cat > efile <<'EOFA'
/  # config.vm.provider "virtualbox" do |vb|/
a
  config.vm.provider "virtualbox" do |v|
   v.memory = 4096
   v.cpus = 4
  end
.
w
q
EOFA

# 2. Create a vagrant image description for an Ubuntu machine
#    and edit description to have config customizations that are
#    needed.
# Ubuntu seems to handle "Guest Additions", that allow host file
# system to map into VM, well. This is a bit broken in CentOS 
# (see https://github.com/CentOS/sig-cloud-instance-build/issues/107 )
vagrant init --force ubuntu/trusty64
cat efile | ed Vagrantfile

# 3. Provide instructions for next step.
echo ' '
echo '###################################'
echo 'Creation of vagrant VM config done'
echo 'Setup is in directory '${CURDIR}
echo "To start VM \" cd ${CURDIR}; vagrant up\""
echo '###################################'
