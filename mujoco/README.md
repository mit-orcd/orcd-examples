## MuJoCo Quickstart Guide

### Introduction
MuJoCo is a free and open source physics engine that aims to facilitate research and development in robotics, biomechanics, graphics and animation, and other areas where fast and accurate simulation is needed.

This Quickstart Guide aims to guide you through the initial setup and examples. For the complete documentation, please visit the [ORCD Docs website](https://orcd-docs.mit.edu/recipes/mujoco/).

### Installation of MuJoCo and Other Requirements
Below are the installation methods for MuJoCo, MuJoCo-Py, and other requirements for running the example files. For detailed documentation on MuJoCo and MuJoCo-py, please visit their [official documentation](https://github.com/openai/mujoco-py).

#### MuJoCo Binaries:
To install MuJoCo-Py, MuJoCo must be installed somewhere in your home directory. This can be done through downloading the MuJoCo binaries, which can be found on their web page. For a more detailed tutorial on the installation of the binaries, please follow the steps in the [ORCD Docs website](https://orcd-docs.mit.edu/recipes/mujoco/#install-the-mujoco-binaries) under "Install the MuJoCo Binaries."

#### Install MuJoCo-py 
- Ensure the environment variables MUJOCO_PY_MUJOCO_PATH and LD_LIBRARY_PATH are properly set to point to your Mujoco installation. You can use the following commands to check:
```bash
echo $MUJOCO_PY_MUJOCO_PATH
echo $LD_LIBRARY_PATH
```
- If not set properly, you can set them using the instructions provided [here](https://orcd-docs.mit.edu/recipes/mujoco/#install-the-mujoco-binaries). 

#### Run on Engaging
Follow these steps if you are using the Engaging Cluster:

1. Load Python Environment
Load either a Python or Anaconda module. For example:
```bash
module load anaconda3/2022.10
```

2. Install MuJoCo-py
Follow the steps [here](https://github.com/openai/mujoco-py) to install MuJoCo-py. 
For example, if installing to the home directory:
```bash
pip install --user 'mujoco-py<2.2,>=2.1'
```
Do not use the --user flag if you want to install in a conda or virtual environment.

Start up python and import mujoco_py to complete the build process:
```python
python
import mujoco_py
```

3. Verify Installation (optional)
Run a few example lines to verify the installation:
```python
import mujoco_py
import os
mj_path = mujoco_py.utils.discover_mujoco()
xml_path = os.path.join(mj_path, 'model', 'humanoid.xml')
model = mujoco_py.load_model_from_path(xml_path)
sim = mujoco_py.MjSim(model)
print(sim.data.qpos)
sim.step()
print(sim.data.qpos)
```

#### Run on SuperCloud
1. Set up Virtual Environment and Install Mujoco-Py
Create the virtual environment on the local disk of the login node and install mujoco-py (install the version you would like to use):
```bash
module load anaconda/2023a
mkdir /state/partition1/user/$USER
python -m venv /state/partition1/user/$USER/mujoco_env
source /state/partition1/user/$USER/mujoco_env/bin/activate
pip install 'mujoco-py<2.2,>=2.1'
```

2. Install Additional Packages (Optional)
Install any other required packages for your MuJoCo jobs:
```bash
pip install pkgname1 
pip install pkgname2
```

3. Finish Build
Once you have installed the required packages, start Python and import mujoco_py to finish the build:
```python
python
import mujoco_py
```

4. Copy Environment to Permanent Storage
Copy the environment to your home directory for permanent storage:
```bash
cp -r /state/partition1/user/$USER/mujoco_env $/software/mujoco/
```

5. Verify Installation (Optional)
Optionally, run example lines to verify the installation:
```python
import mujoco_py
import os
mj_path = mujoco_py.utils.discover_mujoco()
xml_path = os.path.join(mj_path, 'model', 'humanoid.xml')
model = mujoco_py.load_model_from_path(xml_path)
sim = mujoco_py.MjSim(model)
print(sim.data.qpos)
sim.step()
print(sim.data.qpos)
```

### Using MuJoCo in a Job
To ensure proper configuration and usage of MuJoCo in your job environment, you must first load a Python or Anaconda Module and use a job submisison script, to test your MuJoCo setup. 

The mujoco_test.py in this directory includes an example test script to test your MuJoCo setup in a job environment.

**Engaging:**
If using Engaging cluster, simply submit a job using the shell script written in run_batch_engaging.sh in this directory. 

**SuperCloud**
If using an Engaging cluster, simply submit a job using the shell script written in run_batch_supercloud.sh in this directory. 