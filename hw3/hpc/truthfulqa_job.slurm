#!/bin/bash

# Please adjust these settings according to your needs.
#SBATCH --account=ds_ga_1012-2025sp
#SBATCH --partition=c12m85-a100-1
#SBATCH --chdir=/home/dl5635
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=4:00:00
#SBATCH --mem=32GB
#SBATCH --gres=gpu:1
#SBATCH --job-name=truthfulqa
#SBATCH --mail-type=ALL
#SBATCH --mail-user=dl5635@nyu.edu
#SBATCH --output="truthfulqa.out"
#SBATCH --error=truthfulqa.err

module purge
OVERLAY_FILE=/scratch/dl5635/overlay-25GB-500K.ext3:rw
SINGULARITY_IMAGE=/scratch/dl5635/cuda11.4.2-cudnn8.2.4-devel-ubuntu20.04.3.sif

singularity exec --nv \
		--bind /scratch/dl5635/ \
	    --overlay $OVERLAY_FILE $SINGULARITY_IMAGE \
	    /bin/bash -c "
		source /ext3/env.sh
		source /ext3/miniconda/etc/profile.d/conda.sh
		conda activate
		cd /scratch/dl5635/nlu_s25/hw3/
		bash hpc/run_truthfulqa_evaluation.sh
	"
