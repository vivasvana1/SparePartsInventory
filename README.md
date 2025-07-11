# Spare Parts Inventory: Advanced Forecasting, Optimization & Simulation System

**🚀 Production-ready pipeline | 98.9% forecast accuracy | 39% ROI uplift | Industry-leading performance**

A comprehensive, end-to-end solution that fuses state-of-the-art intermittent-demand forecasting, mathematical optimization, and anyLogistix™ simulation to slash total inventory cost while safeguarding service levels.

---

## 🔥 Key Metrics & Impact

| KPI              | Project Result | Benchmark            | Assessment      |
|------------------|----------------|----------------------|-----------------|
| Forecast Accuracy| 98.93%         | 95% (top quartile)   | Best-in-class   |
| MASE             | 0.82           | < 1.0                | Excellent       |
| ROI Index        | 3.56 (+39%)    | —                    | High value      |
| Service Level    | 95%            | 97%                  | Competitive     |
| Fill Rate        | 92.47%         | ≥ 95%                | Good            |
| Lead Time        | 4.01 days      | 3–5 days             | On target       |

> 📌 Benchmarks consolidated from Syntetos & Boylan and recent empirical reviews on intermittent demand forecasting efficacy.

---

## 📋 Table of Contents

1. [Quick Start](#quick-start)
2. [Architecture Overview](#architecture-overview)
3. [Data Pipeline](#data-pipeline)
4. [Forecasting Engine](#forecasting-engine)
5. [Optimization Framework](#optimization-framework)
6. [Simulation & Validation](#simulation--validation)
7. [Power BI Dashboards](#power-bi-dashboards)
8. [Research Foundations & Further Reading](#research-foundations--further-reading)
9. [Installation & Setup](#installation--setup)
10. [Usage Guide](#usage-guide)
11. [Results & Benchmarking](#results--benchmarking)
12. [Contributing](#contributing)
13. [License](#license)

---

## 1 Quick Start <a id="quick-start"></a>

```bash
# Clone the repository
git clone https://github.com/vivasvana1/SparePartsInventory.git
cd SparePartsInventory

# Create environment
conda env create -f environment.yml
conda activate spareparts

# Run the full pipeline
jupyter lab notebooks/01_data_preparation.ipynb   # ➜ Feature engineering
jupyter lab notebooks/04_demand_forecasting.ipynb # ➜ Multi-model forecasts
jupyter lab notebooks/05_inventory_optimization.ipynb
jupyter lab notebooks/06_anylogistix_simulation_tables.ipynb
```
## 2 Architecture Overview <a id="architecture-overview"></a>

```bash

SparePartsInventory/
├── All plots/
│   ├── ABC-XYZ Classification Heatmap.png
│   ├── Daily demand Trend.png
│   ├── KDE-Average Unit Cost Per Day.png
│   └── ... [60+ more plots on demand, revenue, volatility, events]
│
├── Anylogistix/
│   ├── 04_Anylogistix Network Optimization.xlsx
│   ├── 05_Anylogistix Simulation.xlsx
│   ├── 01_Anylogistix Network Optimisation Result/
│   │   ├── 01_Optimised Product Flow Chart.png
│   │   └── ... [multiple result tables]
│   ├── 02_Anylogistix Risk Analysis Experiment Result/
│   │   ├── 01_Final Solution..png
│   │   └── ... [performance plots, costs, lead times]
│   └── 03_Anylogistix Simulation Experiment Results/
│       ├── 01_Final Simulation.png
│       └── ... [inventory, fulfillment, capacity plots]
│
├── notebooks/
│   ├── 01_data_preparation.ipynb
│   ├── 02_data_preparation.ipynb
│   ├── 03_exploratory_data_analysis.ipynb
│   ├── 04_demand_forecasting.ipynb
│   ├── 05_inventory_optimization.ipynb
│   └── 06_anylogistix_simuation_tables.ipynb
│
├── Optimization_models_CPLEX/
│   ├── Spare_parts_inventory_1/
│   │   ├── .oplproject
│   │   ├── Spare_parts_inventory_1.mod
│   │   ├── Spare_parts_inventory_1.dat
│   │   └── ...
│   ├── Spare_parts_inventory_2/
│   │   ├── .oplproject
│   │   ├── Spare_parts_inventory_2.mod
│   │   ├── Spare_parts_inventory_2.dat
│   │   └── ...
│   └── Spare_parts_inventory_3/
│       ├── .oplproject
│       ├── Spare_parts_inventory_3.mod
│       ├── Spare_parts_inventory_3.dat
│       └── ...
│
└── Power-BI Dashboards/
    ├── Forecast Accuracy & Inventory Overview Dashboard.png
    ├── Forecast Accuracy Deep Dive.png
    ├── Forecast Optimization Summary Accuracy, Confidence & ROI.png
    └── SpareParts.pbix
```
## 3 Data Pipeline <a id="data-pipeline"></a>
```bash
# 1. Data Preparation & Feature Engineering
jupyter lab notebooks/01_data_preparation.ipynb

# 2. Exploratory Data Analysis
jupyter lab notebooks/02_exploratory_analysis.ipynb

# 3. Optimization Framework Setup
jupyter lab notebooks/03_optimization_framework.ipynb

# 4. Advanced Forecasting Engine
jupyter lab notebooks/04_demand_forecasting.ipynb

# 5. Inventory Optimization
jupyter lab notebooks/05_inventory_optimization.ipynb

# 6. anyLogistix Simulation Tables
jupyter lab notebooks/06_anylogistix_simulation_tables.ipynb
```
