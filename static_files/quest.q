#! /bin/bash

#SBATCH -N {nodes}
#SBATCH -n {ntasks}
#SBATCH -p {queuetype}
#SBATCH -J {name}
#SBATCH -t {walltime}
#SBATCH -A {key}
#SBATCH -L SCRATCH
#SBATCH -C knl,quad,cache
#SBATCH -o job.oe

#OpenMP settings:
export OMP_NUM_THREADS=1

#run the application:
module purge
module load openmpi

gunzip -f CHGCAR.gz WAVECAR.gz &> /dev/null
date +%s
ulimit -s unlimited

mpirun -np {ntasks} /usr/common/software/modulefiles/vasp/20170629-knl > stdout.txt 2>stderr.txt

gzip -f CHGCAR OUTCAR PROCAR WAVECAR
rm -f CHG
date +%s
