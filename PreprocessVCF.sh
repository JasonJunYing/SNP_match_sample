#!/bin/bash
#SBATCH -N 1
#SBATCH -n 4
#SBATCH --job-name prep
#SBATCH --output prep.txt

samp=MA

for i in *.vcf.gz
do
	echo $i
	vcftools --gzvcf $i --remove-filtered-all --recode --stdout | gzip -c > flt_$i
	bcftools sort flt_$i -o fltsorted_$i
done

gunzip fltsorted*.vcf.gz

for i in fltsorted*.vcf
do
	echo $i
	bgzip -i $i
	tabix -p vcf $i.gz
done

bcftools merge fltsorted_*.vcf.gz > $samp.fltsort.vcf
