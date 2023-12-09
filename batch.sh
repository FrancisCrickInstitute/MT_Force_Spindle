#!/bin/bash
# 2023/04/25 - Script to automate submission of Cytosim jobs

sub="/camp/home/stedmad/home/users/stedmad/Coding/cytosim/cytosim2d/sub.sh"

for d in run[0-9][0-9][0-9][0-9]
do
    ( cd "$d"; cp "$sub" . ; sbatch "sub.sh"; cd ..)
done
