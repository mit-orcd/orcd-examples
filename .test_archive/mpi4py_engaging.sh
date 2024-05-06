
module use /orcd/software/community/001/modulefiles/rocky8/
module load miniforge
module load openmpi/4.1.4-pmi-ucx-x86_64
whoami
python3 -m venv .venv
source .venv/bin/activate
pip install numpy mpi4py
sbatch p2p-job.sh