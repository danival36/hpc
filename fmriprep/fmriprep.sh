#!/bin/bash
#SBATCH --job-name=fmriprep-dan
#SBATCH --time=1:00:00
#SBATCH -n 16 
#SBATCH --mem=20G
#SBATCH --partition=short
##SBATCH --gres=gpu:1
#SBATCH -p short                     # Partition to submit to
#SBATCH -o %x-%j.out # File to which STDOUT will be written
#SBATCH -e %x-%j.err # File to which STDERR will be written

module load singularity

singularity run --cleanenv  -B /homedtic/dvaldes/BIDS/ds003900:/input -B /homedtic/dvaldes/:/output -B /homedtic/dvaldes/FreeSurfer/license.txt:/license.txt -B /homedtic/dvaldes/work:/work  /soft/singularity/fmriprep-21.0.1.simg \
 /input /output participant --participant-label 01  --fs-license-file /license.txt --omp-nthreads 16 --nthreads 16 --ignore slicetiming --output-spaces


