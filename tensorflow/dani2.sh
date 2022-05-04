#!/bin/bash
#SBATCH -J prova_dani_uname10
#SBATCH -p medium 
#SBATCH -N 1
#SBATCH -n 1 #number of cores
#SBATCH  -D /homedtic/dvaldes/tensorflow
#SBATCH -C intel
#SBATCH --nodelist=node024
#SBATCH --mail-type=ALL
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=daniel.valdes@upf.edu
#SBATCH --mem=16G
#SBATCH -o slurm.%N.%J.%u.out # STDOUT
#SBATCH -e slurm.%N.%J.%u.err # STDERR


module load TensorFlow/2.4.1-foss-2020b-CUDA-11.4.3
module load  matplotlib/3.4.3-GCCcore-10.2.0
module load Tkinter/3.8.6-GCCcore-10.2.0

#python dani.py
python tensorflow_test.py
