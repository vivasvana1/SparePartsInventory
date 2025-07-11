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

### 📊 Data Pipeline

#### M5 Forecasting Dataset

The project leverages the **M5 Competition dataset** from Walmart—one of the most comprehensive, hierarchical time-series datasets in the supply chain domain—ideal for modeling **intermittent and lumpy demand**.

#### 📥 Dataset Access

- **Primary Source**: [Kaggle M5 Competition](https://www.kaggle.com/competitions/m5-forecasting-accuracy)
- **Mirror**: [Nixtla M5 Dataset](https://github.com/Nixtla/m5-forecasting-data)
- **Alternative**: [Zenodo M5 Repository](https://zenodo.org/record/3713294)

---

#### Data Processing Pipeline

| Stage              | Process                                                     | Output                        |
|--------------------|-------------------------------------------------------------|-------------------------------|
| **Ingestion**      | Load 58M daily observations from M5 dataset                 | Raw time-series data          |
| **Sampling**       | 1% stratified sampling for prototype development            | Memory-efficient dataset      |
| **Transformation** | Wide → Long format conversion (1,913 time columns)          | Normalized structure          |
| **Feature Engineering** | 27 calendar-based variables for temporal enrichment     | Enriched predictors           |
| **Classification** | ADI-CV² grid for demand pattern identification              | Tags for model selection      |

---

####  Advanced Feature Engineering

#####  Calendar Features (27 Variables)

- `event_in_3days`, `event_name_encoded` — *Event anticipation signals*
- `snap_CA/TX/WI` — *Regional SNAP benefit indicators*
- `is_working_day`, `payday`, `month_end` — *Economic cycle drivers*
- `season`, `quarter`, `week_of_month` — *Seasonal trend decomposition*

---

####  Demand Classification (ADI-CV² Framework)

- **ADI (Average Demand Interval)**:  
  $$
  ADI = \frac{\text{Total Periods}}{\text{Non-zero Demand Periods}}
 $$

- **CV² (Squared Coefficient of Variation)**:  
  $$
  CV^2 = \left( \frac{\sigma}{\mu} \right)^2
  $$


| Pattern       | ADI     | CV²     | Recommended Models           |
|---------------|---------|---------|------------------------------|
| **Smooth**     | < 1.32  | < 0.49  | ETS, SARIMAX                 |
| **Erratic**    | < 1.32  | ≥ 0.49  | Prophet, Event-driven        |
| **Intermittent** | ≥ 1.32 | < 0.49  | Croston, TSB                 |
| **Lumpy**      | ≥ 1.32 | ≥ 0.49  | TSB, Modified Croston        |


## 4 Forecasting Engine <a id="forecasting-engine"></a>

### Forecasting Engine

#### Multi-Model Architecture  
The forecasting system employs a **sophisticated ensemble approach** with 6 specialized algorithms, each optimized for distinct demand patterns typically observed in spare parts management—ranging from smooth to highly intermittent.

#### Model Portfolio

| Model     | Use Case                          | Strengths                              | Implementation                      |
|-----------|-----------------------------------|----------------------------------------|-------------------------------------|
| **TSB**   | Highly intermittent, obsolescence-prone | State-space modeling for intermittent demand | `statsmodels` (custom implementation) |
| **Croston** | Zero-inflated demand series     | Separate size/interval estimation      | Classical method                    |
| **Prophet** | High-value, seasonal patterns   | Holiday effects, trend decomposition   | `fbprophet` with custom regressors  |
| **SARIMAX** | Event-driven, promotional spikes | Handles exogenous variables            | `statsmodels.tsa.statespace`        |
| **ETS**   | Smooth, predictable demand        | Exponential smoothing family           | `statsmodels.tsa.holtwinters`       |
| **Ensemble** | Fallback for ambiguous patterns | Robust averaging of forecasts          | Weighted combination of all models  |

> This hybrid system is evaluated using a 3-tiered gating framework: statistical metrics (MAPE, MAE, RMSE), bias tolerance (±10%), and financial impact (cost-based ROI), ensuring selection of the **best-fit model per SKU-demand cluster**.


