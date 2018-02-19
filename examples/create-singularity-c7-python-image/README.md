Illustration of using vagrant on a local laptop or desktop to create a Centos 7 
Singularity image with Python tools installed. The workflow allows root access
to the container image creation process, which is required to configure the image.
Once the container image is configured it is saved as a read-only image that
can then be used with out root privileges on a shared cluster. To make this
work the scripts here first set up a temporary bootstrap virtual machine (VM) 
running Ubuntu.  The root privileges on the VM can then used to build the 
container image, which is CentOS 7 based in this example. The container image
is then saved and the bootstrap VM can be destroyed id desired. The bootstrap VM
is launched using Vagrant and Virtualbox.

The scripts here work as follows.

 1. Script to create vagrant configuration 
    file, "Vagrantfile". This specifies the basic setup of the bootstrap VM 
    virtual hardware.
  ```
   ./singularity-vagrant-step1.sh
  ```
 1. Script to start the bootstrap VM via vagrant
  ```
   ./singularity-vagrant-step2.sh
  ```
 1. Script to add needed software (including singularity) to the bootstrap VM.
  ```
   ./singularity-vagrant-step3.sh
  ```
 1. Script that uses singularity (running on bootstrap VM) to create a
    contianer image for use on shared cluster.
  ```
   ./singularity-vagrant-step4.sh
  ```
