HOWTO: login to the cluster
===========================

all authentication on the clusters is performed via ssh-keys. 
there are no passwords on the cluster (although you may have
a passphrase protecting the private portion of ssh-key). 


# linux and mac osx

if your account on the engaging-cluster is 'xyz3', 
then your ssh-command would look like 

  <code>ssh -i /path/to/id_rsa xyz3@eofe4.mit.edu</code>

and to scp files to the cluster you could use

  <code>scp -i /path/to/id_rsa some-tarball.tar.gz xyz3@eofe4.mit.edu:/nobackup1/xyz3/</code>

and to use sftp you could

  <code>sftp -i  /path/to/id_rsa xyz3@eofe4.mit.edu</code>

# windows

