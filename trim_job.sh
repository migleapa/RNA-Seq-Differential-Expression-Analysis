#!/bin/bash
#$ -cwd   
#$ -pe smp 2 
#$ -l h_rt=4:0:0
#$ -l h_vmem=6G
#$ -t 1-12
#$ -tc 2

module unload fastqc

module load trimgalore

fastq_dir=/data/scratch/ha221510/ToMigle/FASTQ_raw
results_dir=/data/scratch/ha221510/ToMigle

mkdir -p ${results_dir}/trimmedFastQC

read1=$(sed -n "${SGE_TASK_ID}p" /data/scratch/ha221510/ToMigle/read1_fastqs_list.txt)
read2=$(sed -n "${SGE_TASK_ID}p" /data/scratch/ha221510/ToMigle/read2_fastqs_list.txt)

trim_galore --paired \
			--illumina \
			--dont_gzip \
			--fastqc_args \
			"-o ${results_dir}/trimmedFastQC" \
			-o trimmedFASTQs ${fastq_dir}/${read1[$index]} ${fastq_dir}/${read2[$index]}