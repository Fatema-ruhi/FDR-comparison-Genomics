# FDR-comparison-Genomics
# False Discovery Rate (FDR) Control Under Unequal Variances in Genomic Data

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
├── scripts/         # R code for simulations and statistical testing
├── figures/         # Visualization outputs from experiments
├── thesis/          # PDF of thesis and supporting materials
└── README.md

## 📄 Thesis

[Download preprint of the Thesis PDF] ( https://zenodo.org/records/15874662 )
Citation: Fatema Yesmen Ruhi (2022). "A Comparison of Multiple Testing Procedures for Controlling the False Discovery Rate Under Unequal Variances." Department of Mathematics, Southeast Missouri State University.

## 📜 License

This project is open-source under the MIT License.

````

---

## 📁 2. `fdr-tcga-breast-cancer/README.md`  
**(Current Work – PhD Research / Pipeline Development)**

```markdown
# FDR-Controlled Machine Learning Pipelines for Breast Cancer Genomics

This repository includes ongoing work for building FDR-controlled statistical pipelines to identify cancer-specific gene signatures from high-dimensional genomic datasets, using publicly available data from The Cancer Genome Atlas (TCGA).

## 🎯 Research Objective

To improve biomarker discovery reliability by integrating hypothesis testing with FDR control methods and machine learning classifiers, particularly in the presence of unequal variance across groups.

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

```bash
├── notebooks/       # R Markdown or Jupyter for each pipeline step
├── scripts/         # Modular R/Python scripts
├── results/         # Outputs: tables, figures, ROC curves
├── data/            # Preprocessed (or mock) TCGA files
└── README.md
````

## ⚙️ Tools

* R (edgeR, limma, DESeq2)
* Python (scikit-learn, pandas, numpy)
* TCGAbiolinks
* Bioconductor packages

## 🚧 Status

This project is under active development as part of my PhD research (2025–2029). Results will be submitted to a peer-reviewed journal and shared as a preprint.

## 📜 License

Open-source for academic use. See [LICENSE](./LICENSE).

````

---

## 📁 3. `agri-ml-pest-control/README.md`  
**(Future Work – Agriculture & Ecology)**

```markdown
# Machine Learning for Climate-Smart Pest Control in Agriculture

Prototype code and documentation for developing sustainable, machine-learning-powered pest and nutrient management systems to reduce pesticide use and increase crop yield in corn production.

## 🌱 Goal

To create scalable, data-driven solutions for pest control that:
- Reduce pesticide usage by up to 90%
- Optimize yield in various soil and climate conditions
- Support USDA and EPA sustainability goals

## 📊 Components

- Pest population prediction models
- Weather and soil integration
- Crop response simulation
- Cost-yield optimization

## 🧪 Planned Methodologies

- Time series forecasting (ARIMA, LSTM)
- Ensemble ML models (Random Forest, XGBoost)
- Geospatial mapping and risk zones
- Integration with USDA soil and climate APIs

## 📁 Structure

```bash
├── proposal/        # Project outline, future goals
├── simulations/     # Initial model testing on synthetic data
├── code/            # Python/R scripts
├── data/            # Placeholder or sample data formats
└── README.md
````

## 📚 Tools & Stack

* Python (pandas, scikit-learn, xgboost, TensorFlow)
* R (caret, forecast)
* QGIS or GeoPandas (planned)
* Tableau/Power BI for visualization

## 📝 Project Status

This project is in the early conceptual and prototype stage. Will integrate USDA datasets and collaborate with sustainable agriculture researchers.

