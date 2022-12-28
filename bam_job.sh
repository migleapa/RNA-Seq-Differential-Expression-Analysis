#!/bin/bash
#$ -cwd   
#$ -pe smp 4 
#$ -l h_rt=4:0:0
#$ -l h_vmem=25G
#$ -t 1-6
#$ -tc 2

module unload samtools

module load rsem

bam_dir=/data/scratch/ha221510/ToMigle/Alignment

bam=$(sed -n "${SGE_TASK_ID}p" /data/scratch/ha221510/ToMigle/bam_list.txt)

rsem-calculate-expression \
		--bam \
		--strandedness reverse \
		--no-bam-output \
		-p 2 \
		--paired-end \
		${bam_dir}/${bam} \
		./GRCh38.105.rsem.ref/ref ${bam:0:20}
