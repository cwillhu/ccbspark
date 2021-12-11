#!/usr/bin/bash

# Start a Slurm job and keep it alive during Spark job.
# Usage: slurm-submit.sh keep-alive.sh

#SBATCH -J <JOB_NAME>       
#SBATCH -p mpi              
#SBATCH -t <TIME>           
#SBATCH -o <JOB_DIR>/<JOB_NAME>_%j.out
#SBATCH -e <JOB_DIR>/<JOB_NAME>_%j.err
#SBATCH --nodes=<NNODES>
#SBATCH --mem-per-cpu=<MEM_PER_CPU>
#SBATCH --cpus-per-task=<CPUS_PER_TASK>
#SBATCH --ntasks-per-node=<NTASKS_PER_NODE>
#SBATCH --mail-type=ALL
#SBATCH --mail-user=<EMAIL>

# Write out Slurm job environment
echo $(hostname) > "<JOB_DIR>/$SLURM_JOBID.master.hostname"
echo $(printenv | grep SLURM | sed -rn "s/=(.*)/='\1'/p") \
	> "<JOB_DIR>/$SLURM_JOBID.master.env"

# Keep Slurm job alive during Spark job
while :; do sleep 10000; done
