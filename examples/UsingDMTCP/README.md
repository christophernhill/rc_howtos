DMTCP is a tool that consists of saving a snapshot of the application's state, so that it can restart from that point in time. This is particularly important for long running application that are executed in a system with regular maintenance periods.

DMTCP can be used in simple computer as well as in an Heigh performance computing system. 

#To run a code with DMTCP on a simple machine :
 
1. In a seperate terminal run dmtcp_coordinator

2. In another termianl, run dmtcp_launch ./<your_code>

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

 
#To run a job with slurm in a cluster :

I created a python code that will print the current time and the hostname.

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

 or just comment out the line to pick the default slurm partition
 
 \##SBATCH --partition=sched_any_quicktest

3. change the time dmtcp will take a checkpoint at i
(I edited slurm_launch.job file  and changed the line start_coordinator -i 300). -i will checkpoint automatically every number of second (300 seconds in my example).

4. add the code needed to be run in the slurm_launch.job file (dmtcp_launch --rm mpirun ./date.py)
  
5. run the job with: sbatch slurm_launch.job 

  The user will end up with dmtcp_command.${SLURM_JOBID} ( --job-name=dmtcp_command ) and any output file. 

6. To restart the job from the last check point, run : sbatch slurm_restart.job.

