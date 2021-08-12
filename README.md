# recountmethylation_bioc2021

Welcome to the repo for the Bioc2021 software demo/workshop on `recountmethylation`! Here, you can find key learning resources, including the presentation slides and code, a `recountmethylation` cheatsheet, and a helpful wiki that links to tutorials, Illumina's platform documentation, and key related Bioconductor libraries.

<p style="text-align:center;"><img src="https://github.com/metamaden/recountmethylation_bioc2021/blob/main/images/bioc2021-recountmethylation-hexstickers.jpg" alt="recountmethylation hexsticker" class="center" width="200"/></p>

# Learning resources provided in this repo

* [Workshop recording](https://www.youtube.com/watch?v=nTysBp4fvaw&list=PLdl4u5ZRDMQRA_Fvfg9Bour_x56irZiA2&index=21) -- Pre-recorded lecture for the `recountmethylation` software demo/workshop at Bioc2021
* [Presentation slides](https://github.com/metamaden/recountmethylation_bioc2021/blob/main/workshop_materials/bioc2021_deck.pptx) -- Slides from the Bioc2021 workshop presentation.
* [Presentation code](https://github.com/metamaden/recountmethylation_bioc2021/tree/main/workshop_materials) -- Scripts to reproduce the workshop presentation code examples. You can follow along with these scripts during the code break sections of the presentation.
* [Wiki](https://github.com/metamaden/recountmethylation_bioc2021/wiki) -- Links to platform documentation, Bioconductor dependencies, and tutorials with crucial background.
* [Cheatsheet](https://github.com/metamaden/recountmethylation_bioc2021/tree/main/cheatsheet) -- Overview of terms, code, and a decision tree to determine which database file type to download.

# Details about the invited software demo/workshop

The demo will happen at 7pm PT, August 4th, 2021. You may follow along by referring to the provided slides and scripts. This page will also link to the pre-recorded lecture video, once it's uploaded to YouTube.

## Remote session info

* Author/presenter: Sean K. Maden (maden@ohsu.edu)
* Location: Bioc2021, remote workshop
* Title: *Accessing, querying, and analyzing public DNAm array data compilations with recountmethylation*
* Date: August 4th, 2021
* Conference link: [https://bioc2021.bioconductor.org/posts/paper106/](https://bioc2021.bioconductor.org/posts/paper106/)

## Code break scripts and questions covered

The code break sections of this demo cover fundamental topics to aid an understanding of the file types of the `recountmethylation` database compilation files.

**Code Break #1 questions ([script](https://github.com/metamaden/recountmethylation_bioc2021/blob/main/workshop_materials/part1_rg-2platforms_bioc2021.R))**
* What is the `SummarizedExperiment` container/class?
* What are the classes of `SummarizedExperiment` objects used to analyze DNAm array data?
* How do I inspect properties of `SummarizedExperiment` objects?
* How do I convert `RGChannelSet` objects between DNAm array platforms (e.g. from EPIC to HM450K)?
* How do I combine `RGChannelSet` objects between different platforms?

**Code Break #2 questions ([script](https://github.com/metamaden/recountmethylation_bioc2021/blob/main/workshop_materials/part2_delayedarray-objects_bioc2021.R))**
* How do I download database files from the server ([/recount.bio/data](https://recount.bio/data/)) using the `getdb()` functions?
* How do I convert from `SummarizedExperiment` to `h5se`/`HDF5-SummarizedExperiment`?
* How do I save and load an `h5se` dataset?
* What are the contents of an `h5se` directory, and what error occurs when this fails to load?
* How do I rapidly update the sample metadata, or `colData`, for an `h5se` dataset, without overwriting all the assays data?
* When do I need to recast an `h5se` object as a basic, non-`DelayedArray` backed, `SummarizedExperiment`?

**Code Break #3 questions ([script](https://github.com/metamaden/recountmethylation_bioc2021/blob/main/workshop_materials/part3_find-and-analyze-samples_bioc2021.R))**
* How do I summarize the learned labels for the tissue and disease variables in the sample metadata?
* How do I query the tissue variable for a specific label, using regular expressions?
* How do I summarize available samples by study, for a given subset of filtered samples?
* How would I access GEO in a browser, concurrent with an R session, to better understand my filtered samples?
* What information should I include as I'm annotating studies represented among filtered samples?

# Manuscript citation

If you use `recountmethylation` in published work, please cite the following paper:

Sean K Maden, Reid F Thompson, Kasper D Hansen, Abhinav Nellore, Human methylome variation across Infinium 450K data on the Gene Expression Omnibus, NAR Genomics and Bioinformatics, Volume 3, Issue 2, June 2021, lqab025, https://doi.org/10.1093/nargab/lqab025
