#!/bin/bash
#
# Very simple script to generate commands for tidying a directory with many, many files
# **AS CURRENTLY WRITTEN THIS NOT DOES WORK FOR FILENAMES CONTAINING SPACES OR SPECIAL**
# **CHARACTERS. FEEL FREE TO IMPROVE TO ADD THAT (see find -print0 etc... for ideas)  **
#
# File names are mapped to md5sum and first two sets of two characters are used
# to create directory tree. This means you know where any file is if you
# know its name. 
#
# 1. First use ls -1 to get a list of all the files in the directory
# /bin/ls -1 /nobackup1/denru/Dataset/ImageNet/2014/train/ > big_ls1.txt
# 
# 2. Now generate commands to make directory hierarchy and redistribute files
cat big_ls1.txt | while read line
do
fn=$line
echo $line | md5sum - | awk '{pref="myimages";FN="'${fn}'";dl1=substr($1,1,2);dl2=substr($1,3,2);printf("mkdir -p %s/%s/%s; mv %s %s/%s/%s\n",pref,dl1,dl2,FN,pref,dl1,dl2)}'
done
