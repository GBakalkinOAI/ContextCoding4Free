#!/usr/bin/env Rscript
# Reproducible TCGA-BRCA expression + survival demo
library(TCGAbiolinks)
library(SummarizedExperiment)
library(dplyr)
library(survival)

# ---- RNA-seq (current STAR-Counts workflow) ----
if (!dir.exists("GDCdata_BRCA_STAR")) {
  query <- GDCquery(
    project      = "TCGA-BRCA",
    data.category = "Transcriptome Profiling",
    data.type     = "Gene Expression Quantification",
    workflow.type = "STAR - Counts"      # auto-detected current workflow
  )

  GDCdownload(query, directory = "GDCdata_BRCA_STAR")
  se <- GDCprepare(query, directory = "GDCdata_BRCA_STAR",
                 save = TRUE, save.filename = "tcga_brca_se.rds")
} else {
  # download once, re-use later
  readRDS(expr, "tcga_brca_se.rds")
}

cat("Assay names:", assayNames(se), "\n")      # raw_count / fpkm / tpm / fpkm_uq
cat("Matrix dims :", dim(se), "\n")

# Keep FPKM-UQ
expr <- assays(se)[["FPKM-UQ"]]
# saveRDS(expr, "tcga_brca_fpkm_uq.rds") #


# ---- Minimal overall-survival example ----
clin_q <- GDCquery(
  project      = "TCGA-BRCA",
  data.category = "Clinical",
  file.type     = "xml"
)
GDCdownload(clin_q)
clinical <- GDCprepare_clinic(clin_q, clinical.info = "patient")

surv <- clinical |>
  transmute(
    bcr_patient_barcode,
    status = ifelse(vital_status == "Alive", 0, 1),
    time   = ifelse(is.na(days_to_death),
                    days_to_last_follow_up,
                    days_to_death)
  ) |>
  filter(!is.na(time))

fit <- survfit(Surv(time, status) ~ 1, data = surv)
print(fit)
