#!/bin/bash
#
#SBATCH -p sched_opportunist
#SBATCH -N 4
#SBATCH --exclusive
#SBATCH --constraint=centos7

module load engaging/python
module load singularity
python queue_driver.py
