Using python native threading library and threadsafe queue module to queue up an then dispatch tasks in parallel
at a rate equal to the number of compute resources available. As dispatched taks complete the threads pop another 
task from queue. The number of threads equals the number of concurrent compute resources, this keeps the number
of active taks in balance with the compute available and handles variable duration tasks effectively. 


* Files 

1. run_test.sbatch. Launches the python script. Run using sbatch, example SLURM options coded in the file can be 
   overridden on the command line e.g.
    ```
    $ sbatch -N 2 --exclusive -n 16 run_test.sbatch 
    ```

1. queue_driver.py. Python script using native python queues and threads to schedule a dummy set of `sleep NN` tasks across
    compute resources available to the job where 
    ``NN`` is a random number between 1 and 10.
