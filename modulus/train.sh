#!/bin/bash
#SBATCH -J modulus
#SBATCH -p high
###SBATCH -c 8
#SBATCH -n 1
#SBATCH --mem=8G
#SBATCH -w node024
#SBATCH --gres=gpu:1
#SBATCH -o ./logs/job-%N-%J.out
#SBATCH -e ./logs/job-%N-%J.err

#abort on error
set -e

# Shell version
#singularity shell -B /homedtic/xmorales/modulus/rt/:/rt /soft/singularity/modulus.simg /rt
#/opt/conda/bin/python /rt/code/fourflow.py -m arch.fully_connected.layer_size=128 arch.fully_connected.nr_layers=2,4,6

#SLURM_NPROCS="8"

#ml singularity
export TORCH_CUDA_ARCH_LIST="3.5;5.0+PTX;6.0;7.0;7.5;8.0;8.6"

ml CUDA/11.4.3

# Start docker container
singularity run --cleanenv --nv -B /homedtic/xmorales/modulus/rt/:/rt /soft/singularity/modulus.simg /opt/conda/bin/python /rt/code/fourflow.py -m arch.fully_connected.layer_size=128 arch.fully_connected.nr_layers=6
#singularity exec -B /homedtic/xmorales/modulus/rt/:/rt /soft/singularity/modulus.simg /opt/conda/bin/python /rt/code/fourflow.py -m arch.fully_connected.layer_size=128 arch.fully_connected.nr_layers=2,4,6

# Run the modulus code
#/opt/conda/bin/python /rt/code/fourflow.py -m arch.fully_connected.layer_size=128 arch.fully_connected.nr_layers=2,4,6
