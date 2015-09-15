#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --job-name=myHexclethane
#SBATCH --time=0:50:0
#SBATCH --mem-per-cpu=1G
#SBATCH --partition defq


module add c3ddb/gaussian
unset PGI_TERM
g09 < hexclethane.com | tee /home/$USER/gaussianwork/hexclethane.log
