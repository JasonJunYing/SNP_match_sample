# SNP_match_sample
Codes for scRNA sample demultiplexing using Souporcell or Demuxlet

To match the scRNA-seq data for each cell to its donor, we made use of the position-sorted bam files as outputs from Cellranger pipeline v.7.1.0 and the vcf files generated from WGS data (fastq) using nf-core Sarek pipeline v.3.1.2 (GRCh38, haplotypecaller, default parameters). The vcf files were filtered, sorted and merged according to the scRNA-seq samples [(preprocessing)](./PreprocessVCF.sh). Then, the sorted bam files and the processed vcf files were subjected to [Souporcell v.2.0](https://pubmed.ncbi.nlm.nih.gov/32366989/) and [Demuxlet v.1.0](https://pubmed.ncbi.nlm.nih.gov/29227470/) for clustering and assignment. The scripts were provided as: [Souporcell.sh](./Souporcell.sh); [Demuxlet.sh](./Demuxlet.sh).To match the scRNA-seq data for each cell to its donor, we made use of the position-sorted bam files as outputs from Cellranger pipeline v.7.1.0 and the vcf files generated from WGS data (fastq) using nf-core Sarek pipeline v.3.1.2 (GRCh38, haplotypecaller, default parameters). The vcf files were filtered, sorted and merged according to the scRNA-seq samples [(preprocessing)](./PreprocessVCF.sh). Then, the sorted bam files and the processed vcf files were subjected to [Souporcell v.2.0](https://pubmed.ncbi.nlm.nih.gov/32366989/) and [Demuxlet v.1.0](https://pubmed.ncbi.nlm.nih.gov/29227470/) for clustering and assignment. The scripts were provided as: [Souporcell.sh](./Souporcell.sh); [Demuxlet.sh](./Demuxlet.sh).
