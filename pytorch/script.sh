#!/bin/bash
#SBATCH -J prova_pytorch
#SBATCH -p high 
#SBATCH -N 1 
#SBATCH -n 4 #number of cores
#SBATCH -D /homedtic/dvaldes/pytorch_sample
#SBATCH --mem=10G
#SBATCH --gres=gpu:1
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=daniel.valdes@upf.edu
#SBATCH -o slurm.%N.%J.%u.out # STDOUT
#SBATCH -e slurm.%N.%J.%u.err # STDERR

ml PyTorch/1.10.0-GCCcore-10.2.0-CUDA-11.4.3  
ml matplotlib/3.4.3-GCCcore-10.2.0
ml torchvision/0.9.1-GCCcore-10.2.0-PyTorch-1.10.0-CUDA-11.4.3


sleep 4
echo executant python...
python pytorch.py
