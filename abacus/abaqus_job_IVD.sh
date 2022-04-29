#!/bin/bash
#SBATCH --job-name=batch
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=1G
#SBATCH --partition=high
#SBATCH -o %x-%j.out # File to which STDOUT will be written
#SBATCH -e %x-%j.err # File to which STDERR will be written

singularity run /soft/singularity/abaqus_2020-gfortran.sif "/homedtic/emunoz/codes/abaqus/complete/L2L3/./runjob_batch.sh"
