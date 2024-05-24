#!/bin/bash

if [[ $HOSTNAME == "eofe10.mit.edu" ]];
then
    echo "Testing on Engaging";
else
    echo "Testing on Local (Not Engaging)";

    cd mujoco
    python3 -m venv .venv
    source .venv/bin/activate
    pip install 'mujoco-py<2.2,>=2.1'
    pip install numpy mpi4py

    mpirun -np 4 python p2p-send-recv.py
    mpirun -np 4 python p2p-array.py
fi