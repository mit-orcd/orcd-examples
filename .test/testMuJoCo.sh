#!/bin/bash

if [[ $HOSTNAME == "eofe10.mit.edu" ]];
then
    echo "Testing on Engaging";
    cd mujoco
    python3 -m venv .venv
    source .venv/bin/activate
    pip install 'mujoco-py<2.2,>=2.1'

    echo "Testing Example";
    module load python/3.10.8-x86_64
    python mujoco_test.py
    echo "Testing Job";
    sbatch run_batch_engaging.sh

else
    echo "Testing on Local (Not Engaging)";

    cd mujoco
    python3 -m venv .venv
    source .venv/bin/activate
    pip install 'mujoco-py<2.2,>=2.1'
    pip install numpy mpi4py

    mpirun -np 4 python run_batch_engaging.sh
    mpirun -np 4 python run_batch_supercloud.sh
fi