#!/bin/bash
#
#SBATCH -p sched_any_quicktest
#SBATCH -N 2
#SBATCH -n 4

module load engaging/python
python queue_driver.py
