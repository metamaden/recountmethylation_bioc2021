#!/usr/bin/env R

# Author: Sean Maden

# Code Break #2 -- How to handle the h5se database compilation files

library(recountmethylation)

# download db example
# view the index of all available database compilations at recount.bio/data
# ?getdb # view the help docstrings
getdb_h5se_test(platform = "hm450k", dfp = ".")
h5se.fname <- "remethdb-h5se_gr-test_0-0-1_1590090412"
# download the test GenomicRatioSet from the server
gr.h5se.test <- HDF5Array::loadHDF5SummarizedExperiment(h5se.fname)
class(getBeta(gr.h5se.test))
#[1] "DelayedMatrix"
#attr(,"package")
#[1] "DelayedArray"

# get test HM450K rgset as in code break #1
library(minfiData)
data(RGsetEx)
rg <- RGsetEx

# convert the rg set to an h5se object
h5se.dir <- "rg_h5se"
saveHDF5SummarizedExperiment(x = rg, dir = h5se.dir)
# note dir contents
list.files(h5se.dir)
# load h5se-rg object
rg.h5se <- loadHDF5SummarizedExperiment(h5se.dir)
class(rg.h5se)
class(getBeta(rg.h5se))
class(getGreen(rg.h5se))
# example -- remove one of the required files
unlink(file.path(h5se.dir, "se.rds"))
rg.h5se <- loadHDF5SummarizedExperiment(h5se.dir)
saveHDF5SummarizedExperiment(x = rg, dir = h5se.dir, replace = T)

# rapidly update coldata for an h5se object
# this avoids resaving unaltered assay data, which saves a lot of time for the
# full-size h5se database compilation files
coldata <- colData(rg.h5se)
colnames(coldata)
colData(rg.h5se)$newvar <- "newvalues"
quickResaveHDF5SummarizedExperiment(rg.h5se)
rg.h5se <- loadHDF5SummarizedExperiment(h5se.dir)
"newvar" %in% colnames(colData(rg.h5se))
rg.h5se$newvar

# rg recast example
# this exemplifies a general problem with functions not yet optimized for the
# DelayedArray object classes
minfi::preprocessFunnorm(rg.h5se)
# Error: 'preprocessFunnorm()' only supports matrix-backed minfi objects.
gm <- as.matrix(getGreen(rg.h5se))
rm <- as.matrix(getRed(rg.h5se))
anno <- annotation(rg.h5se)
rg.new <- RGChannelSet(Green = gm, Red = rm, annotation = anno)
gr.new <- minfi::preprocessFunnorm(rg.new)
