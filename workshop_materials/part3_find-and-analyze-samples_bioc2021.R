#!/usr/bin/env R

# Author: Sean Maden

# Code Break #3 -- Summarize and filter samples in a full-sized h5se object
# using the harmonized sample metadata.

library(HDF5Array)

# load data 
# note this gr h5se database compilation includes data from a freeze of EPIC 
# platform samples, with the addition of a new synchronization of recent EPIC
# samples. 
h5se.fname <- "remethdb_h5se_rg_epic-hm850k_merged_1621537799-1589820348_0-0-3"
gr <- loadHDF5SummarizedExperiment(h5se.fname)
dim(gr) # [1] 1052641   13835
# Note: a version of this database file should appear on the server in a few
# months, once our next recountmethylation preprint is out ;^)

# summarize metadata
cd <- colData(gr)
head(colnames(cd))
# [1] "gsm"         "gse"         "gsm_title"   "storageinfo" "sex"         "age"
head(cd$tissue[!is.na(cd$tissue) & !cd$tissue == "NA"])
# [1] "prostate_cancer;cancer;cell_line;prostate" "prostate_cancer;cancer;cell_line;prostate"
# [3] "cells;prostate;epithelial"                 "cells;prostate;epithelial"                
# [5] "fibroblast"                                "fibroblast" 
tissuev <- unlist(strsplit(cd$tissue, ";"))
df.tissue <- as.data.frame(table(tissuev))
df.tissue <- df.tissue[rev(order(df.tissue[,2])),]
head(df.tissue)
# tissuev Freq
# 13            blood 4758
# 75               NA 2797
# 22           cancer 2515
# 92       peripheral 2186
# 93 peripheral_blood 2078
# 21       buffy_coat 1480
tx.query.str <- "kidney"
tx.query.str.format <- paste0("(^|;)",tx.query.str,"($|;)")
tx.filt <- grepl(tx.query.str.format, cd$tissue)
cdf <- cd[tx.filt,]
dim(cdf) # [1]  0 54
tx.query.str <- "colon"
tx.query.str.format <- paste0("(^|;)",tx.query.str,"($|;)")
tx.filt <- grepl(tx.query.str.format, cd$tissue)
cdf <- cd[tx.filt,]
dim(cdf)
# [1] 321  54
df.gse <- as.data.frame(table(cdf$gse))
df.gse <- df.gse[rev(order(df.gse[,2])),]
df.gse
dim(df.gse)
# [1] 9 2
min.gsm <- 20
dff.gse <- df.gse[df.gse[,2] >= min.gsm,]
dff.gse
# Var1 Freq 
# 4 GSE132804  206
# 8 GSE166212   45
# 7 GSE149282   24
sum(dff.gse[,2]) # 275

# evaluate disease term for filtered colon samples
cdff <- cdf[cdf$gse %in% dff.gse[,1],]
dim(cdff) # [1] 275  54
dx.df <- as.data.frame(table(unlist(strsplit(cdff$disease, ";"))))
dx.df <- dx.df[rev(order(dx.df[,2])),]
dx.df
# Var1 Freq
# 4            normal  218
# 1            cancer   52
# 2 colorectal_cancer   12
# 3                NA    5
unique(cdff$gse) # [1] "GSE132804" "GSE149282" "GSE166212"
# make custom annotations at the study level
# this information can help identify homogeneous sample groups that may be more
# relevant to our intended analysis
lgse <- list()
lgse[["GSE132804"]] <- list(title = "Dysfunctional epigenetic aging of the normal colon and colorectal cancer risk", 
                            notes = "Subjects include low to high CRC risk, with possible adenoma or CRC history.")
lgse[["GSE149282"]] <- list(title = "Genome-wide open chromatin methylome profiles in colorectal cancer", 
                            notes = "Study in CRC patients, includes cancer tissues and normal tissues adjacent to cancers.")
lgse[["GSE166212"]] <- list(title = "Colorectal Cancer DNA Methylation", 
                            notes = "Study in CRC tumors, includes demographics and tumor type info.")
# compare gsm record for a single colon sample
gsm.row <- cdff[cdff$gsm == "GSM5065983",]
gsm.row$tissue
# [1] "cancer;tumor;colorectal;intestine;colon;rectum"
gsm.row$disease # [1] "cancer"
gsm.row$sex # [1] "M"

# subset on colon normals
tx.normal.filt <- !grepl("(^|;)cancer($|;)", cdff$tissue)
cdfff <- cdff[tx.normal.filt,]
dim(cdfff) # [1] 223  54
