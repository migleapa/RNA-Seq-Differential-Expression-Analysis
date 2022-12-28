#!/bin/bash
#$ -cwd   
#$ -pe smp 4 
#$ -l h_rt=4:0:0
#$ -l h_vmem=25G
#$ -t 1-6
#$ -tc 2

module load star

trimmed_fastq_dir=/data/scratch/ha221510/ToMigle/trimmedFASTQs

read1=$(sed -n "${SGE_TASK_ID}p" /data/scratch/ha221510/ToMigle/trimmed_read1_fastqs_list.txt)
read2=$(sed -n "${SGE_TASK_ID}p" /data/scratch/ha221510/ToMigle/trimmed_read2_fastqs_list.txt)

STAR --runThreadN 1 \
	 --genomeDir GRCh38.genome \
	 --sjdbGTFfile Homo_sapiens.GRCh38.105.gtf \
	 --sjdbOverhang 149 \
	 --outFilterType BySJout \
	 --outFilterMultimapNmax 20 \
	 --alignSJoverhangMin 8 \
	 --alignSJDBoverhangMin 1 \
	 --outFilterMismatchNmax 999 \
	 --outFilterMismatchNoverReadLmax 0.04 \
	 --alignIntronMin 20 \
	 --alignIntronMax 1000000 \
	 --alignMatesGapMax 1000000 \
	 --readFilesIn ${trimmed_fastq_dir}/${read1[$index]} ${trimmed_fastq_dir}/${read2[$index]} \
	 --outSAMtype BAM SortedByCoordinate \
	 --quantMode TranscriptomeSAM \
	 --outFileNamePrefix ${read1:0:20}
