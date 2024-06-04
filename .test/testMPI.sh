#!/bin/bash

if [[ $HOSTNAME == "eofe10.mit.edu" ]];
then
    echo $HOSTNAME
    echo "On Engaging";

    cd mpi4py
    python3 -m venv .venv
    source .venv/bin/activate
    module load gcc
    module load openmpi

    pip install numpy mpi4py

    echo "Testing Example";
    mpirun -np 4 python p2p-send-recv.py
    mpirun -np 4 python p2p-array.py

    echo "Testing Job";
    # sbatch p2p-job-engaging.sh
    # tail -f
    job_id=$(sbatch p2p-job-engaging.sh | awk '{print $4}')
    cat slurm-$job_id.out
    
    
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

