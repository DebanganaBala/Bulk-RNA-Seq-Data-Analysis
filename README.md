# Bulk-RNA-Seq-Data-Analysis
Step by Step process which involves bash and R programming


I applied the principles learned from Muhammad Dujana's excellent instruction in the 'Bioinformatics: Learn Bulk RNA-Seq Data Analysis From Scratch' Udemy course while working with a FASTQ file in my analysis. For those looking to delve deeper and enhance their foundational knowledge, I highly recommend checking out the course. It offers a comprehensive exploration that will undoubtedly sharpen your basics and provide valuable insights into the intricacies of bioinformatics analysis.

Step1: Installation of Software in Linux Environment 

FastQC- For quality check of the raw reads
Trimmomatic tool- For trimming low-quality reads 
HISAT2 - For the alignment of the reads with the reference genome 
Subread tool- For building of count matrix for DEG Analysis

Step2: Quality check on fastq file 

fastq file: Text-based sequencing data file format that stores both raw sequencing data and quality scores 
Here fastqc function is used on the fastq file to perform quality check. The resultant html file will be found in the working folder. 


