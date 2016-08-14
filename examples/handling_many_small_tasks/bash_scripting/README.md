Simple sbatch script example of queueing several hundred taks to be done, but having srun limit the rate to the number of
resources requested using the job -N and -n options. 

The example is written to use a partition `sched_any_quicktest` to request two nodes from that partition and four tasks spread across those nodes. The srun steps are queued up as one process background jobs with the `--exclusive` option on srun. This sets the processing so that only as many taks will be executing as the number of resources the `-N` and `-n` options have reserved. If more tasks are queued tasks will be held and launched as resources become available.

Assuming you are on a system with a partition called `sched_any_quicktest` then

```
$ sbatch dist_tasks.sbatch 
```

in a terminal will run the example. Otherwise the `sbatch dist_tasks.sbatch` script will need editing to match your system. 
