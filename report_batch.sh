#!/bin/bash

# Need to iterate over the 50 files in the folder:
for i in {0..50}
do
   dir="$(printf 'run%04d' $i)"
   cd $dir;
   cp ../report.sh .;
   sbatch "report.sh"
   #echo $PWD;
   cd ..;
done 


