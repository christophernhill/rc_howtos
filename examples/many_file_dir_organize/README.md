Very basic shell script to generate commands that redistribute files in a directory with too many files in it to a
hierachy of sub-directories under a prefix. In general it is not a good idea to have more than 50,000 files in a directory. 

Running the shell script does not change anything on file system. It just generates commands that can be used to create directory hierarchy and move files. To make the changes the generated commands need to be executed (for example using the `source` command in a bash shell)
