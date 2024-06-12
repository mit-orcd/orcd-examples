#!/bin/bash -l
#SBATCH -N 1
#SBATCH -n 8

module load anaconda3/2022.05-x86_64

source activate mpi
mpirun -np $SLURM_NTASKS python p2p-send-recv.py

source activate mpi
mpirun -np $SLURM_NTASKS python p2p-array.py
