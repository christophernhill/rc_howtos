HOWTO: login to the cluster
===========================

all authentication on the clusters is performed via ssh-keys. 
there are no passwords on the cluster (although you may have
a passphrase protecting the private portion of ssh-key). 


# linux and mac osx

if your account on the engaging-cluster is 'xyz3', 
then your ssh-command would look like 

```ShellSession
ssh -i /path/to/id_rsa xyz3@eofe4.mit.edu
```

and to scp files to the cluster you could use

```ShellSession
scp -i /path/to/id_rsa some-tarball.tar.gz xyz3@eofe4.mit.edu:/nobackup1/xyz3/
```

and to use sftp you could

```ShellSession
sftp -i  /path/to/id_rsa xyz3@eofe4.mit.edu
```


in order to simplify, you may encapsulate these options 
in your ssh config file, viz ~/.ssh/config. nb, X11 forwarding
has been added to this example. 

```Shell
Host eofe*.mit.edu
  User xyz3
  IdentifyFile /path/to/id_rsa
  ForwardX11 yes
  ForwardX11Trusted yes
```

this would allow the simpler commands

```Shellsession
ssh eofe4.mit.edu
scp some-tarball.tar.gz eofe4.mit.edu:/nobackup1/xyz3/
sftp eofe4.mit.edu
```

# windows

