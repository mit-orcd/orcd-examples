cd mpi4py
mpirun -np 4 python p2p-array.py
mpirun -np 4 python p2p-send-recv.py
depends_on: "setup"