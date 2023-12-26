if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

#Installing DESeq2 Package
BiocManager::install("DESeq2")

#Uploading the Feature Count matrix and Metadata File in the working directory
cnt <- read.csv("counts.csv", header = TRUE, row.names = 1)

met <- read.csv("metadata2.csv", header = TRUE, row.names = 1)


#checking names 

all(colnames(cnt) %in% rownames(met))
all(colnames(cnt)== rownames(met))

#If above lines are true then build DESeq Dataset 

#Building DESeq dataset 

library(DESeq2)
dds <- DESeqDataSetFromMatrix(countData = cnt, colData = met, design = ~dexamethasone)
dds


# Removal of low count data 

keep <- rowSums(counts(dds)) >= 10

#Subsetting 

dds <- dds[keep, ]
dds #thousand of rows are removed.

# Setting reference for DEG Analysis 

dds$dexamethasone <- relevel(dds$dexamethasone, ref ="untreated")


#Perform DEG Analysis 

deg <- DESeq(dds)

#to get the results 

res <- results(deg)
res

#Saving the result as a csv file 

write.csv(res,"test.csv")

summary(res)

#Setting p-value 0.05

res0.05 <- results(deg, alpha= 0.05)
summary(res0.05)

#Downloading database

BiocManager::install("org.Hs.eg.db")
BiocManager::install("AnnotationDbi")

library("org.Hs.eg.db")
library("AnnotationDbi")

#Transform res0.05 to data frame  

res0.05.df <- as.data.frame(res0.05)

#Transform geneIds to gene name 

res0.05.df$Symbol <- mapIds(org.Hs.eg.db, rownames(res0.05.df), keytype="ENSEMBL",column="SYMBOL")
res0.05.df

#Saving the dataframe as csv file 
write.csv(res0.05.df,"final_test.csv")



