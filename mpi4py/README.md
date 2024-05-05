## MPI for Python Quickstart Guide

### Introduction
MPI for Python (mpi4py) provides Python bindings for the Message Passing Interface (MPI) standard, allowing Python applications to exploit multiple processors on workstations, clusters and supercomputers. 

This Quickstart Guide aims to guide you through the initial setup and examples. For the complete documentation and installation steps, please visit the [ORCD Docs website](https://orcd-docs.mit.edu/recipes/mpi4py/).

### Prerequisites
To run these examples, a working installation of mpi4py and Numpy libraries is required. For installation steps, please follow the instructions in the [ORCD Docs MPI documentation](https://orcd-docs.mit.edu/recipes/mpi4py/).

### Running Mpi4py Example
In the mpi4py folder, we have three files, p2p-array.py, p2p-send-recv.py, and p2p-job.sh. 

The p2p-array.py is an example file for sending and receiving a dictionary. The p2p-send-recv.py is an example file for sending and receiving an array. The p2p-job.sh is an example job script for running mpi4py codes on 8 CPU cores of one node. 

To submit a job on a cluster, use the following command:
```bash
sbatch p2p-job.sh
```

If running on your local computer, sbatch may not be available. In that case, you can run each Python file individually to confirm it runs. Use the following commands: 

```bash
mpirun -np 4 python p2p-array.py
mpirun -np 4 python p2p-send-recv.py
```