#!/bin/bash

# Check if conda command exists
if ! command -v conda &> /dev/null; then
    echo "Conda not found, installing..."
    
    # Install Miniconda (change the URL if you prefer Anaconda or a specific version)
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p $HOME/miniconda
    rm miniconda.sh
    
    # Add conda to PATH
    export PATH="$HOME/miniconda/bin:$PATH"
    
    echo "Conda installed successfully."
else
    echo "Conda is already installed."
