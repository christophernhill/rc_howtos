#!/bin/bash

# the submit-script for a slurm job is 
# divided into two (2) sections: 
#  1. slurm-directives
#  2. script-proper
# the first section ends once slurm reads
# a line that is neither blank nor a comment.

# slurm-directives 
# lines begining with the characters
# '#SBATCH' are considered slurm-directives.
#
# each slurm-directive contains 
# exactly one (1) slurm option. 
# 
# most command line options and flags
# can be encapsulated in a job-script
# by prefacing the option with the special 
# string '#SBATCH'.

## START-DIRECTIVES
#SBATCH --job-name=foo
#SBATCH --mail-type=ALL
#SBATCH --mail-user=you@somewhere.com

#SBATCH --partition=sched_any_quicktest
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=1000       # memory in MB
#SBATCH --time=00:15:00  # days-hours:minutes:seconds
## END-DIRECTIVES

echo $SLURM_JOB_ID
date
hostname

sleep 15
