#!/bin/bash
#
#SBATCH -p sched_any_quicktest
#SBATCH -N 2
#SBATCH -n 4

# Report job environment
echo 'SLURM_JOB_NODELIST='${SLURM_JOB_NODELIST}
echo 'SLURM_JOB_CPUS_PER_NODE='${SLURM_JOB_CPUS_PER_NODE}

# Create output dir
odir=slurm-${SLURM_JOBID}-out.dir
mkdir ${odir}

#
# Queue up work to be multiplexed across nodes and cores provided by scheduler
for j in {1..500}
do
 slen=$(($RANDOM % 10))
 cmd="sleep ${slen};"' echo `hostname` '"${j} ${slen}"
 srun --output=${odir}/job%J.out --error=${odir}/job%J.err  -N 1 --ntasks=1 --exclusive /bin/bash -c "${cmd}"  &
done

#
# Wait for all to complete
wait
