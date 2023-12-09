#!/bin/bash
# Job submit - Run cytosim models
#SBATCH --job-name=stedad_cytosim
#SBATCH --ntasks=1
#SBATCH --time=23:00:00
#SBATCH --partition=cpu
#SBATCH --mem=8G

sim_dir="/camp/home/stedmad/home/users/stedmad/Coding/cytosim/cytosim2d/bin" 
echo "$sim_dir"
ml purge
#ml GCC/11.3.0
ml foss
ml LAPACK OpenBLAS
srun "${sim_dir}/report" aster > position.txt
