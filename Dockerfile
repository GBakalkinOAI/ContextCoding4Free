# syntax=docker/dockerfile:1
FROM rocker/verse:4.4.0
LABEL org.opencontainers.image.source="https://github.com/your-org/tcga-loy-demo"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        libcurl4-openssl-dev libssl-dev libxml2-dev \
    && apt-get purge -y r-cran-matrixstats \
    && rm -rf /var/lib/apt/lists/*

# Install up-to-date matrixStats first, then Bioc & TCGAbiolinks
RUN R -e "install.packages(c('matrixStats','BiocManager'), repos='https://cloud.r-project.org'); \
          BiocManager::install('TCGAbiolinks', ask=FALSE, update=TRUE)"

WORKDIR /workspace
