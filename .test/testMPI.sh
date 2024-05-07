#!/bin/bash

cd mpi4py

python3 -m venv .venv
source .venv/bin/activate
pip install numpy mpi4py

mpirun -np 4 python p2p-send-recv.py
mpirun -np 4 python p2p-array.py

if [[ $HOSTNAME == "eofe10.mit.edu" ]];
then
    echo "On Engaging";
else
    echo "Not on Engaging";
fi

