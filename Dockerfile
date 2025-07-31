# syntax=docker/dockerfile:1
FROM rocker/verse:4.5
LABEL org.opencontainers.image.source="https://github.com/GBakalkinOAI/ContextCoding4Free"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        libcurl4-openssl-dev libssl-dev libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Bioc & TCGAbiolinks
RUN R -e "BiocManager::install('TCGAbiolinks', ask=FALSE, update=TRUE)"

WORKDIR /workspace
