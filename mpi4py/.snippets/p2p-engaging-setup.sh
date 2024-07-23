-8<-- [start:module]
module load anaconda3/2023.07
-8<-- [end:module]

-8<-- [start:activate]
conda create -n mpi
source activate mpi
conda install mpi4py
-8<-- [end:activate]