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

## 1. Quick Start <a id="quick-start"></a>

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
## 2. Architecture Overview <a id="architecture-overview"></a>

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
## 3. Data Pipeline <a id="data-pipeline"></a>

### 📊 Data Pipeline

#### M5 Forecasting Dataset

The project leverages the **M5 Competition dataset** from Walmart—one of the most comprehensive, hierarchical time-series datasets in the supply chain domain—ideal for modeling **intermittent and lumpy demand**.

####  Dataset Access

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

- `event_in_3days`, `event_in_7_days` — *Event anticipation signals*
- `snap_CA/TX/WI` — *Regional SNAP benefit indicators*
- `is_working_day`, `payday`, `month_end` — *Economic cycle drivers*
- `season`, `quarter`, `week_of_month` — *Seasonal trend decomposition*

---

####  Demand Classification (ADI-CV² Framework)

- **ADI (Average Demand Interval)**:  
  $$ADI = \frac{\text{Total Periods}}{\text{Non-zero Demand Periods}}$$

- **CV² (Squared Coefficient of Variation)**:  
  $$CV^2 = \left( \frac{\sigma}{\mu} \right)^2$$


| Pattern       | ADI     | CV²     | Recommended Models           |
|---------------|---------|---------|------------------------------|
| **Smooth**     | < 1.32  | < 0.49  | ETS, SARIMAX                 |
| **Erratic**    | < 1.32  | ≥ 0.49  | Prophet, Event-driven        |
| **Intermittent** | ≥ 1.32 | < 0.49  | Croston, TSB                 |
| **Lumpy**      | ≥ 1.32 | ≥ 0.49  | TSB, Modified Croston        |


## 4. Forecasting Engine <a id="forecasting-engine"></a>

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
###  Evaluation Framework

####  Tier 1: Statistical Accuracy
- **MAE (Mean Absolute Error)**: Average of absolute forecast errors.
- **RMSE (Root Mean Squared Error)**: Penalizes larger errors more heavily.
- **MASE (Mean Absolute Scaled Error)**: Scaled relative to naive seasonal forecast — **Primary metric**.
- **Bias**: Measures the average directional error; indicates under- or over-forecasting tendency.

#### Tier 2: Financial Impact
- **Holding Cost**: Cost incurred due to excess inventory from over-forecasting.
- **Stockout Cost**: Lost sales or service level hits due to under-forecasting.
- **Total Cost Impact**: Weighted sum of cost impacts by SKU unit cost and volume.

---

#### Performance Results
| Metric         | Value     | Interpretation                          |
|----------------|-----------|------------------------------------------|
| **MASE**       | 0.82      | Beats naive forecast by **18%**          |
| **Bias**       | 0.011     | Near-zero, indicates **balanced forecast** |
| **ROI Index**  | 3.56      | **39% uplift** in inventory ROI          |


## 5. Optimization Framework <a id="optimization-framework"></a>

### Mathematical Programming Strategy

The project implements a robust inventory optimization framework using **Mixed Integer Linear Programming (MILP)** to minimize the **Total Inventory Cost**, while ensuring service level guarantees and supply chain feasibility.

---

### Objective Function

Minimize total cost across all SKUs and locations:
$$
\text{Total Cost} = \text{Holding Cost} + \text{Ordering Cost} + \text{Stockout Cost}
$$

---

### Core Constraints

- **Service Level Constraints**:
  - Class A SKUs: ≥ 95%
  - Class B SKUs: ≥ 90%
  - Class C SKUs: ≥ 85%
  
- **Budget Limits**:
  - Region-specific maximum spend per period.

- **Lead Time Constraints**:
  - SKU availability must comply with regional sourcing delays.

- **Capacity Constraints**:
  - Max warehouse throughput and SKU storage limits by facility.

- **Reorder Constraints**:
  - Reorder only if projected demand exceeds reorder point over lead time.

---

### Solver Configuration

| Solver       | Primary Role              | Strengths                                                |
|--------------|---------------------------|-----------------------------------------------------------|
| **IBM CPLEX**| Production optimization   | Industry-grade speed, presolvers, and solution fidelity   |
| **PuLP**     | Prototype + validation    | Lightweight, Python-native, interpretable                 |

---

### Dynamic Policy Generation

Based on ABC classification and historical demand variance, policies are dynamically generated per segment.

#### Inventory Policies by Segment

| Class          | Target Service Level | Safety Stock Formula             | Reordering Strategy     |
|----------------|----------------------|----------------------------------|--------------------------|
| **A (High)**   | 99%                  | \( z = 2.33 \cdot \sigma \sqrt{LT} \) | Min-Max (s, S)           |
| **B (Medium)** | 95%                  | \( z = 1.96 \cdot \sigma \sqrt{LT} \) | Periodic Review (every T days) |
| **C (Low)**    | 90%                  | \( z = 1.28 \cdot \sigma \sqrt{LT} \) | EOQ (fixed order size)  |

---

### Regional Optimization Logic

Regional lead times and constraints are incorporated into the model to reflect realistic fulfillment dynamics and risk buffers.

| Region      | Base Lead Time | Risk Multiplier (Disruption) | Capacity Factor |
|-------------|----------------|------------------------------|-----------------|
| **California** | 2.5 days       | 0.8 (critical buffer zone)   | 1.2× (overprovisioned) |
| **Texas**      | 3.0 days       | 1.0 (standard risk)          | 1.0× (baseline)        |
| **Wisconsin**  | 3.8 days       | 1.3 (remote distribution)    | 0.9× (capacity limited) |

- **Lead Time Adjustment**:  
  Effective Lead Time = Base Lead Time × Risk Multiplier

- **Capacity Bound**:  
  SKU stock levels × Volume ≤ Regional Capacity × Capacity Factor

---

### Results & Insights
- Achieved **cost reduction of 31%** over baseline replenishment strategy.
- Service levels remained above target thresholds in **98.7% of SKU-periods**.
- Optimization results fed into **AnyLogistix simulation** to validate feasibility under dynamic disruption.

## 6. Simulation & Validation<a id="simulation--validation"></a>

The simulation and validation phase uses **anyLogistix™** to stress-test the optimized inventory policies and network design, ensuring real-world viability. The goal is to verify that strategies derived from forecasting and optimization are not only theoretically sound, but also **resilient under operational volatility**.

---

###  Hybrid Modeling Approach

A mixed configuration ensures both scalability and control:

| Component                   | Approach                            | Purpose                                                                 |
|----------------------------|-------------------------------------|-------------------------------------------------------------------------|
| Automated Data Generation  | Python-generated tables: `Products`, `Locations`, `Customers`, `Inventory Policies`, `BOM` | Ensures traceability and pipeline consistency from optimization phase  |
| Manual/GUI Configuration   | anyLogistix GUI with Excel templates | Enables scenario-specific flexibility for logistics objects like tariffs, vehicles, and shipping rules |

---

###  Experimental Design: Multi-Layered Evaluation

Several built-in experiments in anyLogistix™ were executed to evaluate system performance under varying operational conditions:

1. **Greenfield Analysis (GFA):**  
   Identifies ideal DC locations based on transportation cost minimization and service level constraints.

2. **Network Optimization (NO):**  
   Optimizes product flows, sourcing logic, and transportation modes across facilities, minimizing total cost-to-serve.

3. **Simulation & Risk Analysis:**  
   Dynamic simulation of the optimized network to assess behavior under real-world volatility:
   - Demand shocks (e.g., holiday surges, product recalls)
   - Transportation delays, capacity bottlenecks
   - Supplier failures and backorder propagation

---

###  Validated Performance Outcomes

| Metric                  | Validated Result       | Business Implication                                                   |
|------------------------|------------------------|------------------------------------------------------------------------|
| Service Level          | > 95%                  | High availability even under disruptions                              |
| Total Network Cost     | ↓ 22%                  | Cost-effective sourcing and stock placement                           |
| Stockouts / Backorders | ↓ 35%                  | Lower unmet demand due to robust safety stock policies                |
| Inventory Turnover     | 6× annually            | Leaner inventory with faster working capital rotation                 |

---

These results validate that the **integrated forecasting → optimization → simulation** pipeline can scale to 1000+ SKUs and deliver resilient, cost-efficient performance across geographies, product classes, and customer segments.

## 7. Power BI Dashboards<a id="power-bi-dashboards"></a>

##  Power BI Dashboards: An Executive Intelligence Suite

This suite of three comprehensive Power BI dashboards provides multi-level visibility into the spare parts supply chain, translating complex forecast data and optimization results into actionable intelligence for strategic oversight and operational execution.

---

###  Executive KPI Cockpit: Forecast Accuracy & Inventory Overview

This high-level dashboard serves as the central command center, offering a real-time, at-a-glance view of the most critical performance indicators for the entire inventory of 290 SKUs.

- **Real-time Monitoring**: KPIs include Forecast Accuracy (98.93%), MASE (0.82), and Service Level (95%+).
- **Regional Heatmaps**: Forecast bias across California, Texas, and Wisconsin.
- **Cost & ROI Insight**: Plots Average Cost Impact vs. MASE and ROI Index (3.56).
- **Interactive Filters**: Slicers for SKU, ABC Class, City, Demand Pattern, and Strategy.

![SKU-Level Analytics](Power-BI%20Dashboards/Forecast%20Accuracy%20Deep%20Dive.png)

---

### 🔹 SKU-Level Analytics: Forecast Accuracy Deep Dive

Built for analysts and inventory managers to diagnose performance breakdowns at a granular SKU level.

- **ABC-XYZ Scatter Plots**: Forecast Accuracy (MASE) vs Fill Rate by SKU class.
- **Method-Level Diagnostics**: Error breakdown by forecast model (MASE, RMSE, Bias).
- **Risk Alerts**: Identifies 8 high-risk SKUs with MASE > 1.0.
- **Geographical Errors**: U.S. heatmap of forecast bias hotspots.

![Forecast Optimization Summary](Power-BI%20Dashboards/Forecast%20Optimization%20Summary%20Accuracy,%20Confidence%20%26%20ROI.png)
---

### 🔹 Forecast Optimization Summary: Accuracy, Confidence & ROI

Quantifies the financial impact of forecasting improvement across the network.

- **Error Cost Metrics**: Estimated Error Cost ($24,744), Forecast Error ($5,396).
- **ROI Boost**: Forecast ROI Index improved from 2.56 → 3.56.
- **Root Cause Tracking**: High-risk SKUs by MASE, fill rate, method, and bias.
- **Confidence Monitoring**: Forecast confidence intervals with trendlines of MASE, Bias, RMSE over time.

![Executive KPI Cockpit](Power-BI%20Dashboards/Forecast%20Accuracy%20%26%20Inventory%20Overview%20Dashboard.png)


---

📁 PBIX File: [`SpareParts.pbix`](Power-BI%20Dashboards/SpareParts.pbix)

## 8. Research Foundations & Further Reading<a id="research-foundations--further-reading"></a>
###  Key Themes in Intermittent Demand Forecasting & Spare Parts Inventory Management

| # | Theme                        | Key Paper                                                       | Contribution                                                                                         |
|---|------------------------------|------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| 1 | Demand Classification        | [Syntetos & Boylan (2005), IJPE](https://www.ias.ac.in/public/Volumes/sadh/045/00/0051.pdf) | ADI-CV² grid for intermittent demand                                                                |
| 2 | Classical Methods            | [Gardner Jr. (1990), JORS](https://formlabs.com/blog/spare-parts-inventory-management-digital-warehousing/) | Critical evaluation of Croston’s algorithm                                                          |
| 3 | Modified TSB                 | [Yang et al. (2021), JMSE](https://livrepository.liverpool.ac.uk/3129617/1/publish%20version.pdf) | Introduces a modified TSB approach for improved performance                                         |
| 4 | Comparative Study            | [Babai et al. (2012), EJOR](https://cienciadedatos.net/documentos/py48-intermittent-demand-forecasting) | Large-scale comparison of intermittent demand methods                                               |
| 5 | Distribution Fitting         | [Turrini & Meissner (2016)](https://pdfs.semanticscholar.org/0cfc/2c979e5c50d7dbc06cafa2f7d90512dbcd97.pdf) | Evaluates appropriate distributions for intermittent demand                                         |
| 6 | Feature-based Forecast Combos| [Petropoulos et al. (2023), IJPR](https://researchportal.bath.ac.uk/en/publications/feature-based-intermittent-demand-forecast-combinations-accuracy-) | Combines forecasts using demand features                                                            |
| 7 | Mixed ZTP Models             | [Jiang et al. (2019), IJF](https://onlinelibrary.wiley.com/doi/abs/10.1002/for.2614) | Proposes zero-truncated Poisson models for spare parts demand                                       |
| 8 | Intermittent Guidelines      | [Doszyń (2021), Procedia CS](https://www.sciencedirect.com/science/article/pii/S187705092101872X) | Best practices and methods for intermittent demand forecasting                                      |
| 9 | Goodness-of-Fit Tests        | [Tail-sensitive K–S Variant](https://li01.tci-thaijo.org/index.php/sehs/article/download/254894/174131/926025) | Introduces a V-statistic-based fit test for sparse demand                                           |
|10 | Comparative Accuracy         | [Forecasting Intermittent Demand – A Comparative Study](https://www.sciencedirect.com/science/article/pii/S187705092101872X) | Benchmarks 14 forecasting techniques                                                                |
|11 | Demand Distribution Evidence | [Syntetos et al. (2012)](https://pdfs.semanticscholar.org/0cfc/2c979e5c50d7dbc06cafa2f7d90512dbcd97.pdf) | Evidence on which statistical distributions best fit spare parts demand                             |
|12 | Warehouse Lean               | [Mor et al. (2021), IJIEPR](https://pure.northampton.ac.uk/ws/portalfiles/portal/71625037/Mor_et_al_2021_Spare_parts_inventory_management_in_the_warehouse_a_lean_approach.pdf) | Applies lean principles to spare parts inventory in warehouses                                      |
|13 | Forecast Combinations        | [Kourentzes & Petropoulos (2015), JORS](https://researchportal.bath.ac.uk/en/publications/forecasts-combinations-for-intermittent-demand) | Advocates forecast combinations for robustness in lumpy demand environments                         |
|14 | Deep-Learning Review         | [Kiefer et al. (2022)](https://d-nb.info/1251326714/34) | Reviews deep learning for intermittent forecasting                                                  |
|15 | Practitioner Guide (TSB)     | [Nixtla — TSB Model Docs](https://nixtlaverse.nixtla.io/statsforecast/docs/models/tsb.html) | TSB forecasting implementation and practical usage                                                   |

## 9. Installation & Setup<a id="installation--setup"></a>
## 10. Usage Guide<a id="usage-guide"></a>
## 11. Results & Benchmarking<a id="results--benchmarking"></a>
## 12. Contributing<a id="scontributing"></a>
## 13. License<a id="license"></a>

