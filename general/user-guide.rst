**Who can get a HPC account?**

	Any one who is a MIT employed and currently working in the MIT research community

**How to get a HPC user account?**

	First, user needs to request an account. From your browser, goto https://eofe1.mit.edu/request_account.
	Once the account request gets approved, user will receive a confirmation email.

.. note:: Example email for engaging users

	welcome to the engaging cluster

here is a very low-frill introduction
to the cluster and its environment. 

     	1. mailing list

		engaging users are subscribed to the engaging1-users@mit.edu mailing list

     	2. login
		ssh -i /path/to/sshkey -l {username} eofe4.mit.edu

		ssh -i /path/to/sshkey -l {username} eofe5.mit.edu

     	3. directories

		~{username} 		- working space for source code, scripts,hand-edited files etc.

		/nobackup1/{username}	- lustre parallel file system for parallel I/O.

		/pool001/{username}	- NFS file system if you need it.

     	4. software

		module avail

     	5. scheduler

		SLURM:
		
		1. what jobs are running

			squeue -a

		2. what nodes are temporarily reserved for specific users

			sinfo -T

		3. what is running in the default short test queue useful for getting started and debugging

			squeue -p {partition name}

		4. what nodes are in a particular "partition"

			sinfo -p {partition name}

			Note nodes that have been temporarily allocated to dedicated projects are shown as down*.

			1. launch an interactive session e.g. on one node with 16 cores and exclusive use of the node

				salloc -N 1 -n 16 -p {partition name}—time=1:00:00 --exclusive

			2. ask for a node with a GPU resource

				salloc --gres=gpu:1 -N 1 -n 16 -p {partition name} --time=1:00:00 --exclusive

			3. batch job running something

				cat <

				myjob.slurm

				#!/bin/bash

				#SBATCH --gres=gpu:1

				#SBATCH -N 1

				#SBATCH -n 16

				#SBATCH --time=1:00:00

				#SBATCH --exclusive

				. /etc/profile.d/modules.sh

				module add gcc

				module add mvapich2/gcc

				/cm/shared/apps/cuda55/sdk/current/1_Utilities/deviceQuery/deviceQuery
				


				sbatch myjob.slurm


     	6. useful tutorials http://www.tchpc.tcd.ie/node/74

     	7. system info

		- 234 64GB RAM
		- 2 x 8-core 2.0GHz CPUs
		- 90 K20m GPU
		- 16 Xeon phi
		- base OS - RHEL/Centos 6.4 


**How to login to cluster**

.. note:: 
	User can only login to cluster using ssh key. There is no password associated with user account.
	
::
	For engaging cluster users:

			ssh -i /path/to/sshkey -l {username} eofe4.mit.edu
		or	ssh -i /path/to/sshkey -l {username} eofe5.mit.edu

	For C3DDB cluster users:

			ssh  -i /path/to/sshkey -l {username} c3ddb01.mit.edu

**Location of home directory**

	User home directory is under ~{username}

**Where are the scratch disk space I can use?**

	For engaging cluster users, scratch space is under /nobackup/{username}

	For C3DDB cluster users, scratch space is under /scratch/users/{username}

**The space limit for home directory and scratch space?**

	User home directory space is limited. It is intend for user to save their code, documents  and small tests and it is not for data storage. 

	The scratch space is for storing computational data and it is on much fast Lustre system. Since the space is shared among all cluster users. Please be considerate and clean up your unwanted or not needed data as often as you can.

**The memory for each CPU core**

	This is depending on which cluster and partition you are using. 

**What is the time limit for a job run**

     Depends on partition. Some partitions may offer 12 hours for normal job run and 15min for a quick test. Others may offer different time. Sometimes special arrangements can be made depending on the requirements.

**Can user log into compute nodes**

     User can only log into a compute node if user owns a job running on the node.

**The cluster node hardware configuration**

	Engaging cluster has:
		- 234 64GB, 2 x 8-core 2.0GHz CPUs
		- 90 K20m GPU
		- 16 Xeon phi
		- base OS - RHEL/Centos 6.4

	C3DDB cluster has:
	     	- 90 256GB
		- 2 x 8-core AMD Opteron(tm) Processor 6376
		- base OS - RHEL/Centos 6.4

**How to use SLURM**

	submit an interactive job

     		salloc -N 1 -n 16 -p {partition name} --time=1:00:00 -exclusive

::

		where:
     			-N # : number of nodes
     			-n # : number of CPU cores
     			-p <name> : specific partition
     			--time=<hh:min:sec> : run time
     			—-exclusive : using all 16 cores on a single node
     
	submit a batch job

::

		cat <
		myjob.slurm
		#!/bin/bash
		#SBATCH --gres=gpu:1
		#SBATCH -N 1
		#SBATCH -n 16
		#SBATCH --time=1:00:00
		#SBATCH --exclusive
		. /etc/profile.d/modules.sh
		module add gcc
		module add mvapich2/gcc
		/cm/shared/apps/cuda55/sdk/current/1_Utilities/deviceQuery/deviceQuery

		
		sbatch myjob.slurm

	view jobs

::

		squeue -a			/* show all jobs
		squeue -p {partition name} 	/* show jobs in specific partition indicated by {partition name}

	delete a job

::

		scancel {job ID}		/* delete a job

	show nodes

::

		sinfo -T			/* show nodes temporarily reserved for specific users
		sinfo -p {partition name}	/* show nodes in specific partition indicated by <partition name>


**How to load modules**

::

	module list				/* List loaded modules
	module avail				/* List modules available on the system
	module load {module name}		/* add module you need. Default is the latest version
	module load {module name/version}	/* add a specific version of the module
	module rm {module name}			/* remove module you do not need
	module initadd {module name}		/* add module when you login



**Tech Support Contact**

::

	engaging cluster users:	please send end email to	engaging-admin@techsquare.com

	C3DDB cluster users: 	please send email to 		c3ddb-admin@techsquare.com


**Useful links**

	http://www.tchpc.tcd.ie/node/74

	http://www.tchpc.tcd.ie/node/128

	For matlab users:

	http://www.mathworks.com/help/distcomp/createjob.html

	http://www.mathworks.com/help/distcomp/parallel.job.html
