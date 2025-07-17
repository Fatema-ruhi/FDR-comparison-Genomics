# FDR-comparison-Genomics
# Enhancing Cancer Diagnostics through Integrated Statistical and Machine Learning Approaches

This repository contains the code, results, and documentation from my master's thesis:
**"A Comparison of Multiple Testing Procedures for Controlling the False Discovery Rate Under Unequal Variances."**

## 📌 Overview
This research evaluates and compares multiple FDR-controlling procedures under the presence of unequal group variances, commonly seen in genomic datasets. The aim is to minimize false discoveries while maintaining statistical power in high-dimensional, heterogeneous biological data.

## 🧪 Methods Covered

- Monte Carlo method
- Benjamini-Hochberg (BH)
- Storey q-value
- Bonferroni + Empirical Variance (Bon-EV)
- Permutation test, Welch's t-test, Neubert-Brunner test
- Simulation-based performance metrics (FDR, FNDR)

## 🧬 Application

Simulations focused on identifying significant genes from breast cancer datasets. Although this study is methodological in nature, it is directly relevant for large-scale genomic hypothesis testing (e.g., RNA-seq, microarray studies).

## 📁 Structure

```bash
├── data/            # Simulated datasets and sample input structure
├── scripts/         # R code for simulations and statistical testing ( https://github.com/Fatema-ruhi/FDR-comparison-Genomics/blob/37f93fa66f747cde537d65ebbb0b9eedb16cafda/Thesis_Code.R )
├── figures/         # Visualization outputs from experiments
├── thesis/          # PDF of thesis and supporting materials
└── README.md

## 📄 Thesis

[Download preprint of the Thesis PDF] ( https://zenodo.org/records/15874662 )
Citation: Fatema Yesmen Ruhi (2022). "A Comparison of Multiple Testing Procedures for Controlling the False Discovery Rate Under Unequal Variances." Department of Mathematics, Southeast Missouri State University.

## 📁 2. `fdr-tcga-breast-cancer/README.md`  
**(Current Work – Pipeline Development)**
** Link to the R code: ( https://github.com/Fatema-ruhi/FDR-comparison-Genomics/blob/b2301ca759fd0a6b9f6ecf517fc5330001c17aa9/Current%20Rcode%20(in%20progress) ) 
# FDR-Controlled Machine Learning Pipelines for Breast Cancer Genomics

This repository includes ongoing work for building FDR-controlled statistical pipelines to identify cancer-specific gene signatures from high-dimensional genomic datasets, using publicly available data from the National Cancer Insitute GDC data.

## 🎯 Research Objective

To improve biomarker discovery reliability by integrating hypothesis testing with FDR control methods and machine learning classifiers across groups of data.

## 🔬 Methods

- Differential gene expression analysis
- FDR control (BH, Storey q-value, Bon-EV)
- Feature selection based on test statistics
- Classification using Random Forest, SVM, and Logistic Regression
- ROC and AUC evaluation for model performance

## 🧬 Data Source

- TCGA Breast Invasive Carcinoma (BRCA) RNA-seq expression data  
- Clinical metadata: stage, subtype, outcome

## 📁 Structure

├── notebooks/       # R Markdown
├── scripts/         # Modular R
├── results/         # Outputs: tables, figures, ROC curves
├── data/            # Preprocessed GDC files
└── README.md
````


## 🚧 Status

This project is under active development as part of my independent and PhD research (2025–2029). Results will be submitted to a peer-reviewed journal and shared as a preprint.
