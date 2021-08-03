#!/usr/bin/env R

# Author: Sean Maden

# Code break #1 -- How to handle SummarizedExperiment objects of DNAm array
# data from either the HM450K or EPIC platform

# BiocManager::install(c("minfi", "minfiData", "minfiDataEPIC"))
library(minfiData)
library(minfiDataEPIC)

# load the example se data
# here, we load the example RGChannelSet data
data(RGsetEx)
data(RGsetEPIC)
rg.hm450k <- RGsetEx
rg.epic <- RGsetEPIC

# inspect the example data
dim(rg.hm450k)
dim(getBeta(rg.hm450k))
dim(rg.epic)
dim(getBeta(rg.epic))

# convert epic to hm450k
ref.platform <- "IlluminaHumanMethylation450k"
rg.epic.convert <- convertArray(rg.epic, ref.platform)
dim(rg.epic.convert)

# combine epic and hm450k
out.type <- "IlluminaHumanMethylation450k"
rg.combined <- combineArrays(object1 = rg.hm450k, 
                               object2 = rg.epic, 
                               outType = out.type)


