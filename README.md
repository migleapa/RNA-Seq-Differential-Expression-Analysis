# RNA-seq-Differential-Expression-Analysis

Author: Migle Apanaviciute

Date: 28/12/2022

**About Data**:<br/>
RNA-seq data from Human HGSC (high grade serous ovarian cancer) cell line - OVCAR4.<br/>
Data split into 2 groups (3 samples each): carboplatin-resistant vs carboplatin-sensitive.

**Data Sets**:<br/>
Libraries were sequenced to a target coverage of 50 × on Illumina's HiSeq 4000 (2 x 75 bp paired end reads).<br/> 
In total there are 12 raw FASTQ files (2 for each sample).

**Objective**:<br/>
Investigate the changes in gene expression and effects on Gene Ontology Biological Pathways (GOBP) in carboplatin-resistant samples compared to carboplatin-sensitive.

**Bioinformatics Pipeline**:<br/>
*Bash:*<br/>
Running QC on FASTQ files.<br/>
Adapter trimming using trim_galore.<br/>
Mapping to the human genome (hg38, Genome Reference Consortium GRCh38) using STAR.<br/>
Quantification of gene abundance using rsem.<br/>
*R:*
Generating matrix of the rsem estimated_counts.<br/>
Filtering out low count genes (allowing 10 counts in at least 3 samples).<br/>
To see relationship among two groups using unsupervised clustering: PCR and dendrogram.<br/>
Differential Expression Analysis using DESeq2.<br/>
Annotating using Ensembl annotation.<br/>
Performing Pre-Ranked Gene Set Enrichment Analysis (GSEA Pre-Ranked) using Molecular Signatures Database (c5.go.bp.v7.4.symbols.gmt).<br/>
Performing pathway analysis using online tool Reactome.

**Results:**<br/>
Gene Ontology Biological Pathways (GOBP) related to the tumor micro-environment, particularly the extracellular matrix, were enriched in carboplatin-resistant cells




I have developed a decision tree model to estimate the relative cost-effectiveness of new treatment for Malaria in Kenya. I have estimated the costs from health providers perspective and expressed benefits as disability-adjusted life years (DALYs) averted. Some of the parameters were obtained from Shillcutt, S. et al. (2008) study and some of them were hypothetical. I performed deterministic and probabilistic sensitivity analyses to assess the impact of uncertainty in the model’s parameter values on the cost-effectiveness results. I used Monte Carlo simulations to estimate uncertainty and presented this using cost-effectiveness acceptability curve (CEAC).

"Applied Methods of Cost-Effectiveness Analysis in Health Care.xlsx" excel file containing decision model and sensitivity analyses.

"Economic Evaluation in Health Care- Rationale Parameters and Report.docx" word document containing rationale, parameters and report of this project.
