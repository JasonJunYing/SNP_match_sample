library(limma)
filelist <- list.files(".",pattern = 'txt')
for(l in filelist){
  fn <- strsplit2(l,'_')[1]
  fl <- read.delim(l)
  sl <- read.csv(paste0('../Samplesheets/Sheets/',fn,'.csv'),stringsAsFactors = F) # sample sheet
  
  fl$assigned_unique <-strsplit2(fl$assignment,'\\/')[,1]
  fl$assigned_sample <- sl$patient[as.numeric(fl$assigned_unique)+1]
  fl$assignment <- gsub("\\/","or",fl$assignment)
  write.csv(fl,paste0(fn,'_cluster_assigned.csv'))
}
