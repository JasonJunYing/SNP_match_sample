library(limma)
method = 'GT'

method1 = 'Demuxlet'
method2 = 'Souporcell'
ls = strsplit2(list.files(paste0('../Demuxlet_outputs/demuxlet_outs_raw/',method)),'.best')[,1]

for(samp in ls){
  res1 <- read.table(paste0('../Demuxlet_outputs/demuxlet_outs_raw/',method,'/',samp,'.best'))
  colnames(res1)<-res1[1,]
  rownames(res1)<-res1$BARCODE
  colnames(res1)[1]<-"barcode"
  
  res2 <- read.csv(paste0('../Souporcell_outputs/',samp,'_cluster_assigned.csv'),row.names = 1)
  res2$assigned_sample_method1 <- gsub(paste0(samp,'_'),paste0(samp,'-'),res1[res2$barcode,'SNG.1ST'])
  res2$matched <- startsWith(res2$assigned_sample_method1,res2$assigned_sample)
  
  write.csv(res2,paste0('./Compared_results/Compared_',samp,'.csv'))
  
  res1_clean <- res1[match(res2$barcode,res1$barcode),]
  res1_clean <- res1_clean[!is.na(res1_clean$barcode),]
  dropouts <- res2[match(setdiff(res2$barcode,res1_clean$barcode),res2$barcode),]
  
  write.csv(res1_clean,paste0(samp,'_',method1,'_assigned.csv'))
  write.csv(dropouts,paste0(samp,'_',method1,'_dropouts.csv'))
}
