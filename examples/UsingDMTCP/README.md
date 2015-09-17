
**n.b: the dmtcp is preferable not running it as root.**

1. In a seperate terminal run dmtcp_coordinator

2. In another termianl, run dmtcp_launch fibonacci_code

3. On the dmtcp_coordinator use:

          h<return> for help

          c<return> for checkpoint

          l<return> for list of processes to be checkpointed

          k<return> to kill processes to be checkpointed

          q<return> to kill processes to be checkpointed

Three files will be created : dmtcp_restart_script.sh, dmtcp_restart_script_{hash}.sh and {hash}.dmtcp .
If all processes were on the same processor,and there were no .dmtcp files prior to this checkpoint:
dmtcp_restart ckpt_*.dmtcp, otherwise dmtcp_restart_script.sh will work.

P.S: If no option are defined, the default values of host (localhost) and port (7779) will be used.
To specify a diferent host and port, either use --coord-host and --coord-port (or the environment variables DMTCP_COORD_HOST and DMTCP_COORD_PORT).
 
To run a job with slurm, I found this codes to run and restart a job:

To run a job:
 
https://github.com/dmtcp/dmtcp/blob/master/plugin/batch-queue/job_examples/slurm_launch.job

To relaunch the job to continue from where it stopped:

https://github.com/dmtcp/dmtcp/blob/master/plugin/batch-queue/job_examples/slurm_rstr.job

dmtcp_coordinatoor -i <time_in_second> is used to create a checkpoint at the second specified. 

In the example:

1. I ran a python code that prints current time with the next incremented number (starting from 1 to 900)

[afadli@eofe4 dmtcp]$ Mon Aug 31 15:25:25 2015 	1

[afadli@eofe4 dmtcp]$ Mon Aug 31 15:25:26 2015 	2

[afadli@eofe4 dmtcp]$ Mon Aug 31 15:25:27 2015 	3 

the code is as follow (named date.py):

    #!/usr/bin/env python
    import datetime
    import time
    import socket

    test_time = open('test.time', 'w')
    test_time.write('today is\n')
    test_time.close()
    number = 0
    for i in range(900):
       test_time = open('test.time', 'a')
       today = time.strftime("%c")
       number += 1
       time.sleep(1)
       hostname = socket.gethostname()
       print today, hostname   # 2008-03-09 <type 'datetime.date'>
       test_time.flush()
       test_time.write(str(today))
       test_time.write('\t')
       test_time.write(str(number))
       test_time.write('\t')
       test_time.write(str(hostname))
       test_time.write('\n')
       test_time.close()
    for line in file('test.time'):
         print line,

1. I added the modules needed.

    **module add engaging/dmtcp/2.4.0** 

    **module add engaging/openmpi/1.8.8**

2. I changed the partition ( for my test I picked the default which run a job for 15 minutes)
\#SBATCH --partition=sched_any_quicktest

 or just comment the line
 
 \##SBATCH --partition=sched_any_quicktest

3. change the time dmtcp will take a checkpoint at (edit slurm_launch and chage the line start_coordinator -i 300). -i will checkpoint automatically every number of second (300 in my example).

4. dmtcp_launch --rm mpirun ./date.py
  
5. run the job with: sbatch slurm_launch.

  The user will end up with dmtcp_command.${SLURM_JOBID} ( --job-name=dmtcp_command ) and any output file. 

6. To restart the job for the check point, run sbatch slurm_restart.job.

This is my example : 

[afadli@eofe4 dmtcp]$ sbatch slurm_launch.job
 
Submitted batch job 2276221



