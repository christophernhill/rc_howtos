Sometimes a job wants to process lots (hundreds, thousands or more) of small items of work that each only last a few seconds. The top-level
scheduling in SLURM is not ideal suited to this on its own. It takes SLURM a little time to figure out the 
packing problem of which resources are free and which things should be scheduled in what order of priority. When doing 
this for hundreds or thousands of short things the SLURM scheduling logic and processing can get overloaded.
Fancy alternate schedulers like MESOS can be used as an alternate, but such approaches break backwards compatability
with all the useful things that traditional schedulers like SLURM provide. 

The scripts in this directory illustrate some ways to fit a many small task approach into a basic SLURM environment. The 
scripts address two common needs

1. Workflows that want to run hundreds or more of short tasks and have the computer system take care of scheduling them.

2. Workflows with short tasks that may have variable duration, but that want the computer system to work through them 
without swamping the resources allocated.

A lot of rather sophisticated tools exist for handling these sort of workloads. For example combinations such as 
RabbitMQ and python Celery. These are great tools, but involve quite a bit of infrastructure. Some of the example here
are much more lightweight and use basic bash or pythong. They can be useful although they may not scale to millions of
tasks. 

Script directories

* bash_scripting/ This example is the simplest. It uses bash and srun to illustrate lauching a set
   of tasks that are of random duration of between 1 and 10 seconds. Only as many tasks are running 
   at once as the number of CPU cores available to the job. As a task finishes another will start so that
   all the CPU cores are kept busy and work starts up on a CPU core as it becomes available. 
