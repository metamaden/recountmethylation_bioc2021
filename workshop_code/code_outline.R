#!/usr/bin/env R

# Author: Sean Maden

# Bioc2021 code outline

library(recountmethylation)

# View available database files

library(ExperimentHub)

hub = ExperimentHub::ExperimentHub() # connect to the hubs
rmdat <- AnnotationHub::query(hub, "recountmethylation") # query the hubs
rmdat
ExperimentHub with 6 records
# snapshotDate(): 2021-05-18
# $dataprovider: GEO/GDS
# $species: Homo sapiens
# $rdataclass: HDF5-SummarizedExperiment, HDF5Database
# additional mcols(): taxonomyid, genome, description,
#   coordinate_1_based, maintainer, rdatadateadded,
#   preparerclass, tags, rdatapath, sourceurl, sourcetype 
# retrieve records with, e.g., 'object[["EH3773"]]' 

           title                                  
  EH3773 | remethdb-h5se_gr_0-0-1_1590090412      
  EH3774 | remethdb-h5se_gm_0-0-1_1590090412      
  EH3775 | remethdb_h5se-rg_0-0-1_1590090412      
  EH3776 | remethdb-h5se_gr-test_0-0-1_159009041  
  EH3777 | remethdb-h5_rg_0-0-1_1590090412.h5     
  EH3778 | remethdb-h5_rg-test_0-0-1_1590090412.h5

eid <- "EH3778" # h5 test file id
fpath <- rmdat[[eid]] # download with default caching
rhdf5::h5ls(fpath)

eid <- "EH3778" # h5 test file id
fpath <- rmdat[[eid]] # download with default caching
rhdf5::h5ls(fpath)

servermatrix() # site is down

# Load a test dataset
dn <- "remethdb-h5se_gr-test_0-0-1_1590090412"
path <- system.file("extdata", dn, package = "recountmethylation")
h5se.test <- HDF5Array::loadHDF5SummarizedExperiment(path)