## MuJoCo Quickstart Guide

### Introduction
MuJoCo is a free and open source physics engine that aims to facilitate research and development in robotics, biomechanics, graphics and animation, and other areas where fast and accurate simulation is needed.

This Quickstart Guide aims to guide you through the initial setup and examples. For the complete documentation and installation instructions, please visit the [ORCD Docs website](https://orcd-docs.mit.edu/recipes/mujoco/).

### Prerequisites
To run these examples, a working installation of MuJoCo-py libraries is required. For installation steps, please follow the instructions in the [ORCD Docs MuJoCo documentation](https://orcd-docs.mit.edu/recipes/mujoco/).


### Using MuJoCo in an Example Job
To ensure proper configuration and usage of MuJoCo in your job environment, you must first load a Python or Anaconda Module and use a job submisison script, to test your MuJoCo setup. 

The mujoco_test.py in this directory includes an example test script to test your MuJoCo setup in a job environment.

**Engaging:**
If using Engaging cluster, simply submit a job using the shell script written in run_batch_engaging.sh in this directory. 

**SuperCloud**
If using an Engaging cluster, simply submit a job using the shell script written in run_batch_supercloud.sh in this directory. 