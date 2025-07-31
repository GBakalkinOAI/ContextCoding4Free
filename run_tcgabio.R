#!/usr/bin/env Rscript
# Minimal example: query and download HTSeq FPKM-UQ counts for TCGA-BRCA

library(TCGAbiolinks)

print("Updated query")

query <- GDCquery(
  project      = "TCGA-BRCA",
  data.category = "Transcriptome Profiling",
  data.type     = "Gene Expression Quantification",
  workflow.type = "STAR - Counts"        # <-- NEW
)

print(query)

print("Legacy query")

query <- GDCquery(
  project      = "TCGA-BRCA",
  data.category = "Gene expression",       # legacy naming
  data.type     = "Gene expression quantification",
  platform      = "Illumina HiSeq",        # legacy hg19
  legacy        = TRUE,
  workflow.type = "HTSeq - FPKM-UQ"
)

print(query)


# Uncomment next lines to actually download & prepare
# GDCdownload(query)
# se <- GDCprepare(query)
# print(dim(se))