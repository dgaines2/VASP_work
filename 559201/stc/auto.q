#! /bin/bash

#SBATCH -N 1
#SBATCH --ntasks-per-node=28
#SBATCH -p RM-small
#SBATCH -J 559201
#SBATCH -t 1:00:00
#SBATCH -A mr4s8rp
#SBATCH -o job.oe

ulimit -S unlimited
module load intel/18.4
export I_MPI_JOB_RESPECT_PROCESS_PLACEMENT=0

VASP=/opt/packages/private/VASP-5.4.4/vasp_std
mpirun -np $SLURM_NTASKS $VASP > stdout.txt 2>stderr.txt
