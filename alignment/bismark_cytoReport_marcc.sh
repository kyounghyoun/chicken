#!/bin/bash

#SBATCH
#SBATCH --job-name=cytoReport
#SBATCH --time=1:0:0
#SBATCH --partition=shared
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#####SBATCH --cpus-per-task=3
#SBATCH --mail-type=end
#SBATCH --mail-user=ilee29@jhu.edu

###load module
module load perl

###execute
wdir=$PWD
outdir=/scratch/groups/wtimp1/170119_chicken/aligned/${1}
bismarkpath=/home-2/ilee29@jhu.edu/Code/Bismark
refpath=/scratch/groups/wtimp1/Reference/chicken/galGal5

${bismarkpath}/coverage2cytosine --gzip --dir ${outdir}/ --genome_folder ${refpath} -o ${1}.cyto.txt.gz ${outdir}/${1}.full.bismark.cov.gz

cd $outdir

${bismarkpath}/bismark2report 

cd $wdir