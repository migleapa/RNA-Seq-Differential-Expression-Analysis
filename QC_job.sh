#!/bin/bash
#$ -cwd   
#$ -pe smp 4 
#$ -l h_rt=4:0:0
#$ -l h_vmem=23G
#$ -t 1-12
#$ -tc 6

module load fastqc	

fastq_dir=/data/scratch/ha221510/ToMigle/FASTQ_raw
results_dir=/data/scratch/ha221510/ToMigle

mkdir -p ${results_dir}/fastQC

fastq=$(sed -n "${SGE_TASK_ID}p" /data/scratch/ha221510/ToMigle/raw_fastqs_list.txt)
fastqc ${fastq_dir}/${fastq} -o ${results_dir}/fastQC
