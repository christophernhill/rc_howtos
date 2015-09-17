#!/bin/bash

## slurm-directives
#SBATCH --job-name=foo
#SBATCH --mail-type=ALL
#SBATCH --mail-user=you@somewhere.com

#SBATCH --partition=sched_any_quicktest
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=1000       # memory in MB
#SBATCH --time=00:15:00  # days-hours:minutes:seconds

## administrativia
echo SLURM_JOB_ID: $SLURM_JOB_ID
echo SLURM_JOB_NODELIST: $SLURM_JOB_NODELIST
date
echo ""

## environment-modules
if [ ! -e /etc/profile.d/modules.sh ]; then
  echo /etc/profile.d/modules.sh does not exist > /dev/stderr
else
  source /etc/profile.d/modules.sh
  module add mit/matlab/2015b
fi

## science ! 
sleep 15

