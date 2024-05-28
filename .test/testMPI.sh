#!/bin/bash

if [[ $HOSTNAME == "eofe10.mit.edu" ]];
then
    echo $HOSTNAME
    echo "On Engaging";

    module load anaconda3/2023.07

    source activate mpi
    mpirun -np $SLURM_NTASKS python p2p-send-recv.py

    source activate mpi
    mpirun -np $SLURM_NTASKS python p2p-array.py
    sbatch p2p-job.sh
    
else
    echo $HOSTNAME
    echo "Not on Engaging";

    cd mpi4py
    python3 -m venv .venv
    source .venv/bin/activate
    pip install numpy mpi4py

    mpirun -np 4 python p2p-send-recv.py
    mpirun -np 4 python p2p-array.py
fi

