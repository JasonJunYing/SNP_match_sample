#!/bin/bash
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --job-name souporcell-PE
#SBATCH --output log-souporcell-PE.txt

#k provided as the number of patients in each sample
samp='PE'
k=4

singularity exec -B /cluster/groups/Wangxiaonan/share/:/data /cluster/groups/Wangxiaonan/share/yingjun/wgs_works/Souporcell/souporcell_latest.sif souporcell_pipeline.py -i /data/AS_CITESeq/processed_b2/${samp}/outs/possorted_genome_bam.bam -b /data/AS_CITESeq/processed_b2/${samp}/outs/filtered_feature_bc_matrix/barcodes.tsv.gz -f /data/cellranger_index/Homo_sapiens_assembly38.fasta -t 16 -o /data/yingjun/AS_CITE/FinalWork/Souporcell_work/${samp} -k $k --known_genotypes /data/yingjun/wgs_works/E20231289-1-3/VCF_Batch2/${samp}/${samp}.fltsort.vcf

