#!/bin/bash -l
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -p sched_mit_orcd

module load openmpi/gcc/64/1.8.1
module load openmind/anaconda/3-2022.05

mpirun -np $SLURM_NTASKS python p2p-send-recv.py
mpirun -np $SLURM_NTASKS python p2p-array.py
