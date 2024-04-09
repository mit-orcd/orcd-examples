## MPI for Python Quickstart Guide

### Introduction
MPI for Python (mpi4py) provides Python bindings for the Message Passing Interface (MPI) standard, allowing Python applications to exploit multiple processors on workstations, clusters and supercomputers. 

This Quickstart Guide aims to guide you through the initial setup and examples. For the complete documentation, please visit the [ORCD Docs website](https://orcd-docs.mit.edu/recipes/mpi4py/).

### Installation of Mpi4py and other requirements
There are two main methods of installation: Anaconda and Pip. 

#### Anaconda Installation:
1. **Activate Anaconda Environment:**
   - If Anaconda is not installed, consider either using pip or installing it from the [official website](https://docs.anaconda.com/free/anaconda/install/index.html).
   - Activate an Anaconda environment.

2. **Install mpi4py:**
   ```bash
   conda install -c conda-forge mpi4py
   ```

3. **Install numpy library**
    We will also need to install the numpy library to run one of the exampe files. 
    ```bash
    pip install numpy
    ```

#### Pip Installation:
**Note:** To use pip to install Mpi4py, an OpenMPI module is needed. You can install the module through the [official documentation](https://docs.open-mpi.org/en/v5.0.x/installing-open-mpi/quickstart.html). The Mpi4py official documentation is also available on their [website](https://mpi4py.readthedocs.io/en/stable/install.html). 

1. **Install via requirements.txt**
   - Open your terminal and optionally start a virtual environment.
   - Navigate to the mpi4py directory containing the requirements.txt.
   - Run the following command to install both NumPy and mpi4py:
    
    ```bash
    pip install -r requirements.txt
    ```

2. **Install manually**
    We can also install each module seperatly in the terminal.
    ```bash
    pip install mpi4py
    pip install numpy
    ```

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