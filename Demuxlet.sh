#!/bin/bash
#SBATCH -N 1
#SBATCH -n 4
#SBATCH --job-name demuxlet-LA-PL
#SBATCH --output log-demuxlet-LA-PL.txt

samp='LA'
sam=/cluster/groups/Wangxiaonan/share/AS_CITESeq/processed_b2/${samp}/outs/possorted_genome_bam.bam
vcf0=/cluster/groups/Wangxiaonan/share/yingjun/wgs_works/E20231289-1-3/VCF_Batch2/${samp}.fltsort.vcf

#remove contigs that caused error
cat $vcf0 | sed '/^##contig/d' > ../${samp}_processed.vcf

vcf=../${samp}_processed.vcf

#field = PL/GT (columns in VCF)
field=PL

demuxlet --sam $sam --vcf $vcf --out $samp --field $field
