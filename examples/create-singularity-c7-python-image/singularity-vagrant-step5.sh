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

# Step 5
# 5.1 Get rid of intermediate files, VMs and containers.

. ./setup-vagrant-parms.sh

# 1.
vagrant destroy -f
vagrant box remove -f --provider virtualbox ubuntu/trusty64
