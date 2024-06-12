#!/bin/bash -l
#SBATCH -N 1
#SBATCH -n 8

# module load anaconda3/2023.07

source activate mpi
mpirun -np $SLURM_NTASKS python p2p-send-recv.py

source activate mpi
mpirun -np $SLURM_NTASKS python p2p-array.py
