===========================
Frequently Asked Questions
===========================

Who can get a HPC account?
--------------------------

Any one who is MIT employed and currently working in the MIT research community

How to get a HPC user account?
------------------------------

First, user needs to request an account. From your browser, 

.. code-block::

	engaging users: goto https://eofe1.mit.edu/request_account
	
.. code-block::

	c3ddb users: 	goto https://c3ddb01.mit.edu/request_account

Once the account request gets approved, user will receive a confirmation email.

How to login to cluster?
------------------------

.. note:: 
	User can only login to cluster using ssh key. There is no password associated with user account.
	
.. code-block::

	For engaging cluster users:

		ssh -i /path/to/sshkey -l {username} eofe4.mit.edu
	or	ssh -i /path/to/sshkey -l {username} eofe5.mit.edu

.. code-block::

	For C3DDB cluster users:

			ssh  -i /path/to/sshkey -l {username} c3ddb01.mit.edu

Location of home directory
--------------------------

User home directory is under ~{username}

Where are the scratch disk space I can use?
-------------------------------------------

.. code-block::

	For engaging cluster users, scratch space is under /nobackup/{username}

.. code-block::

	For C3DDB cluster users, scratch space is under /scratch/users/{username}

What is the space limit for home directory and scratch space?
-------------------------------------------------------------

User home directory space is limited. It is intend for users to save their code, documents  and small tests and it is not for large data storage. 

The scratch space is for storing computational data and it is on much fast Lustre system. Since the space is shared among all cluster users. Please be considerate and clean up your unwanted or not needed data as often as you can.



The memory for each CPU core
----------------------------

This is depending on which cluster and partition you are using. 

What is the time limit for a job run?
------------------------------------

Depends on partition. Some partitions may offer 12 hours for normal job run and 15 min. for a quick test. Others may offer different time. Sometimes special arrangements can be made depending on the requirements.
     
Can user log into compute nodes?
--------------------------------

User can only log into a compute node if user owns a job running on the node.

The cluster node hardware configuration
---------------------------------------
.. code-block::

	Engaging cluster has:
	- 234 64GB, 2 x 8-core 2.0GHz CPUs
	- 90 K20m GPU
	- 16 Xeon phi
	- base OS - RHEL/Centos 6.4

.. code-block::

	C3DDB cluster has:
	- 90 256GB
	- 2 x 8-core AMD Opteron(tm) Processor 6376
	- base OS - RHEL/Centos 6.4

How to use SLURM?
-----------------

.. code-block::

	submit an interactive job

     		salloc -N 1 -n 16 -p {partition name} --time=1:00:00 -exclusive

		where:
     			-N # : number of nodes
     			-n # : number of CPU cores
     			-p <name> : specific partition
     			--time=<hh:min:sec> : run time
     			—-exclusive : using all 16 cores on a single node
     
.. code-block::

	submit a batch job

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

.. code-block::

	view jobs

	squeue -a			/* show all jobs
	squeue -p {partition name} 	/* show jobs in specific partition indicated by {partition name}

.. code-block::

	delete a job

	scancel {job ID}		/* delete a job

.. code-block::

	show nodes

	sinfo -T			/* show nodes temporarily reserved for specific users
	sinfo -p {partition name}	/* show nodes in specific partition indicated by <partition name>


How to load modules?
--------------------

.. code-block::

	module list				/* List loaded modules
	module avail				/* List modules available on the system
	module load {module name}		/* add module you need. Default is the latest version
	module load {module name/version}	/* add a specific version of the module
	module rm {module name}			/* remove module you do not need
	module initadd {module name}		/* add module when you login



Tech Support Contact:
---------------------

.. code-block::

	engaging cluster users:	please send end email to	engaging-admin@techsquare.com

.. code-block::

	C3DDB cluster users: 	please send email to 		c3ddb-admin@techsquare.com


Useful links:
-------------

.. code-block::

	http://www.tchpc.tcd.ie/node/74
	http://www.tchpc.tcd.ie/node/128

.. code-block::

	For matlab users:
	http://www.mathworks.com/help/distcomp/createjob.html
	http://www.mathworks.com/help/distcomp/parallel.job.html
