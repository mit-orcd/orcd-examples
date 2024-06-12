#!/bin/bash

if [[ $HOSTNAME == "eofe10.mit.edu" ]];
then
    echo $HOSTNAME
    echo "On Engaging"

    cd mpi4py
    python3 -m venv .venv
    source .venv/bin/activate
    module load gcc
    module load openmpi

    pip install numpy mpi4py

    # echo "Testing Example";
    # ulimit -l unlimited
    # mpirun -np 4 python p2p-send-recv.py
    # mpirun -np 4 python p2p-array.py

    echo "Testing Job"
    # sbatch p2p-job-engaging.sh
    # tail -f
    
    job_id=$(sbatch -p sched_mit_orcd p2p-job-engaging.sh | awk '{print $4}')

    while [[ $(squeue -j $job_id | wc -l) -gt 1 ]]; do sleep 2; done
    pwd 
    ls

    cat slurm-$job_id.out
    jobfailed=$(sacct -j $job_id -o State | grep -c -m 1 FAILED)
    if [[ $jobfailed -eq 0 ]]; then exit 0; fi 
    
    # sacct -j $job_id -o State
    # squeue -j $job_id | wc -1


else
    echo $HOSTNAME
    echo "Not on Engaging"

    cd mpi4py
    python3 -m venv .venv
    source .venv/bin/activate
    pip install numpy mpi4py

    mpirun -np 4 python p2p-send-recv.py
    mpirun -np 4 python p2p-array.py
fi

