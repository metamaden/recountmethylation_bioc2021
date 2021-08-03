# recountmethylation_bioc2021

Author/presenter: Sean K. Maden (maden@ohsu.edu)

Location: Bioc2021, remote workshop

Title: *Accessing, querying, and analyzing public DNAm array data compilations with recountmethylation*

Date: August 4th, 2021

Conference link: [https://bioc2021.bioconductor.org/posts/paper106/](https://bioc2021.bioconductor.org/posts/paper106/)

# Description

Welcome to the repo for the Bioc2021 workshop on `recountmethylation`! Here, you can find key learning resources, including the presentation slides and code, a `recountmethylation` cheatsheet, and a helpful wiki that links to tutorials, Illumina's platform documentation, and key related Bioconductor libraries.

# Lecture for the demo/workshop

This page will also link to the pre-recorded lecture video, once it's uploaded to YouTube. When watching this lecture, you can follow along during the Code Break sections by referring to the corresponding scripts deposited [here](https://github.com/metamaden/recountmethylation_bioc2021/tree/main/workshop_materials). 

This lecture covers a number of topics which I find important for understanding and working with the database compilation files, including:

**Code Break #1**
* What is the `SummarizedExperiment` container/class?
* What are the classes of `SummarizedExperiment` objects used to analyze DNAm array data?
* How do I inspect properties of `SummarizedExperiment` objects?
* How do I convert `RGChannelSet` objects between DNAm array platforms (e.g. from EPIC to HM450K)?
* How do I combine `RGChannelSet` objects between different platforms?

**Code Break #2***
* How do I convert from `SummarizedExperiment` to `h5se`/`HDF5-SummarizedExperiment`?
* How do I save and load an `h5se` dataset?
* What are the contents of an `h5se` directory, and what's error when this fails to load?
* How do I rapidly update the sample metadata, or `colData`, for an `h5se` dataset, without overwriting all the assays data?
* When do I need to recast an `h5se` object as a basic, non-`DelayedArray` backed, `SummarizedExperiment`?

**Code Break #3***
* How do I summarize the learned labels for the tissue and disease variables in the sample metadata?
* How do I query the tissue variable for a specific label, using regular expressions?
* How do I summarize available samples by study, for a given subset of filtered samples?
* How would I access GEO in a browser, concurrent with an R session, to better understand my filtered samples?
* What information should I include as I'm annotating studies represented among filtered samples?

# Resources

* [Workshop recording]()(This will link to the pre-recorded lecture video once it's uploaded!)

* [Presentation slides](https://github.com/metamaden/recountmethylation_bioc2021/blob/main/workshop_materials/bioc2021_deck.pptx) -- Slides from the Bioc2021 workshop presentation.

* [Presentation code](https://github.com/metamaden/recountmethylation_bioc2021/tree/main/workshop_materials) -- Scripts to reproduce the workshop presentation code examples. You can follow along with these scripts during the code break sections of the presentation.

* [Wiki](https://github.com/metamaden/recountmethylation_bioc2021/wiki) -- Links to platform documentation, Bioconductor dependencies, and tutorials with crucial background.

* [Cheatsheet](https://github.com/metamaden/recountmethylation_bioc2021/tree/main/cheatsheet) -- Overview of terms, code, and a decision tree to aid with using `recountmethylation`.

<p style="text-align:center;"><img src="https://github.com/metamaden/recountmethylation_bioc2021/blob/main/images/bioc2021-recountmethylation-hexstickers.jpg" alt="recountmethylation hexsticker" class="center" width="200"/></p>
