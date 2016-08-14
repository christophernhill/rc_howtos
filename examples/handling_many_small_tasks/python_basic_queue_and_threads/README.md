Using python native threading library and threadsafe queue module to queue up an then dispatch tasks in parallel
at a rate equal to the number of compute resources available. As dispatched taks complete the threads pop another 
task from queue. The number of threads equals the number of concurrent compute resources, this keeps the number
of active taks in balance with the compute available and handles variable duration tasks effectively. 
