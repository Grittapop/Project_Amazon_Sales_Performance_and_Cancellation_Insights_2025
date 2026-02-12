# 📊 Amazon Sales Performance & Cancellation Insights 2025

An end-to-end data project demonstrating capabilities across:

- 🏗 Data Engineering / Analytics Engineering  
- 📈 Data Analytics  

This project simulates a production-grade modern data stack — from data ingestion and transformation to orchestration and executive-level reporting.


---


# 🔎 Project Overview

This project analyzes Amazon Sales data for 2025 to:

- Monitor business performance  
- Identify revenue drivers  
- Investigate high cancellation rates  
- Support data-driven decision making  

The solution integrates:

- PostgreSQL (Data Warehouse)
- dbt (Data Transformation)
- Apache Airflow (Workflow Orchestration)
- Docker (Containerized Infrastructure)
- DBeaver (Database Validation)
- Power BI (Business Intelligence Layer)


---


# 🧱 Data Source & Attribution

## Data Source

**Dataset Name:** Amazon Sales Analysis 2025  
**Author:** Ali Hassan Kamal  
**Source:** Kaggle  
**Link:** https://www.kaggle.com/datasets/alihassankamal/amazon-sales-analysis-2025  
**License:** Public dataset (as provided on Kaggle)


---


## Dataset Description

The dataset contains transactional-level sales data for Amazon orders in 2025, including:

- Order ID and Order Date  
- Product and Category information  
- Quantity and Total Sales  
- Customer details  
- Geographic location  
- Payment method  
- Order status (Completed, Pending, Cancelled)  

The dataset represents e-commerce transactional records designed for analytical and business intelligence practice.


---


## Data Usage Disclaimer

This project is created for educational and portfolio purposes only.

The dataset is publicly available on Kaggle and is used strictly for demonstration of data engineering and analytics skills.

The data does not represent any real company's actual financial or operational performance.


---


# 🏗 Part 1 — Data Engineering & Analytics Engineering

## 1️⃣ Architecture Overview

![overview project](https://github.com/user-attachments/assets/5d2e3e20-b57b-421e-8d2e-24a1c018ede9)


# 🛠 Tools & Technologies

- PostgreSQL
- dbt (Data Build Tool)
- Apache Airflow
- Docker
- DBeaver
- Power BI
- Kaggle (Data Source)


---


## 2️⃣ Data Warehouse Design

The warehouse follows a **Star Schema** to optimize analytical performance and BI usability.

![data model](https://github.com/user-attachments/assets/3f892b94-1bd3-4339-a221-00d79be6969c)


### ⭐ Fact Table

`fact_sales`

- order_id  
- date  
- product_key  
- customer_key  
- location_key  
- payment_key  
- status_key  
- quantity  
- total_sales  

### 🌟 Dimension Tables

- dim_product  
- dim_customer  
- dim_location  
- dim_payment  
- dim_status  

### ✔ Design Benefits

- Improves query performance  
- Reduces join complexity  
- Supports scalable analytical workloads  
- Optimized for BI tools  


---


## 3️⃣ dbt Model Architecture

The project follows layered modeling best practices:

```
models/
 ├── staging/
 │     ├── source.yml
 │     ├── stg_amazon_sales.sql
 │     ├── stg_customer.sql
 │     ├── stg_product.sql
 │     ├── stg_location.sql
 │     ├── stg_payment.sql
 │     └── stg_status.sql
 │
 ├── intermediate/
 │
 └── marts/
       ├── dim_customer.sql
       ├── dim_location.sql
       ├── dim_payment.sql
       ├── dim_product.sql
       ├── dim_status.sql
       ├── fact_sales.sql
       └── fact_sales.yml
```

### 🔹 Staging Layer

- Cleans raw data  
- Standardizes column names  
- Casts data types  
- Prepares structured inputs  

### 🔹 Mart Layer

- Builds dimension tables  
- Builds fact table  
- Applies data quality tests  


---


## 4️⃣ Data Quality (dbt Tests)

Data integrity is enforced through:

- not_null tests  
- unique tests  
- relationship tests (foreign key validation)  

This ensures referential integrity between fact and dimension tables.


---


## 5️⃣ Workflow Orchestration (Apache Airflow)

DAG: `amazon_sales_dbt_build`

![airflow](https://github.com/user-attachments/assets/93ff6700-2169-4393-a206-e6b1d4903390)


Execution Flow:

```
dbt_deps → dbt_build
```

Configuration:

```python
schedule_interval="@daily"
catchup=False
```

### ✔ Airflow Enables

- Automated warehouse refresh  
- Task dependency management  
- Monitoring via Airflow UI  
- Production-style orchestration  


---


## 6️⃣ Docker Setup

All services run inside Docker containers.

### 🔧 Required `.env` File

Create a `.env` file in the project root:

```
AIRFLOW_UID=50000
```

This prevents permission issues on Linux systems when running Airflow inside Docker.


---


### 🚀 Build & Run

```bash
docker compose build
docker compose up airflow-init
docker compose up -d
```


---


## 🌐 Access Services

- **Airflow UI** → http://localhost:8080  
- **PostgreSQL** → localhost:5432  
- Use **DBeaver** to connect and validate the database  


---


## 🗄 Database Validation with DBeaver

DBeaver is used to:

- Inspect schema  
- Validate Star Schema structure  
- Run manual validation queries  
- Debug transformation logic  
- Verify fact and dimension relationships  


---


## 💡 Engineering Capabilities Demonstrated

- Data Warehouse Design  
- Star Schema Modeling  
- ELT Pipeline with dbt  
- Workflow Orchestration with Airflow  
- Dockerized Infrastructure  
- Environment Configuration Management  
- Data Quality Enforcement  
- Production-Oriented System Design  


---


# 📈 Part 2 — Data Analytics

## 1️⃣ Objective

Analyze sales performance and investigate high cancellation rates to support data-driven business decisions.


---


## 2️⃣ Power BI Data Model

The Power BI model mirrors the warehouse Star Schema and includes a Date Dimension.

![Data Model in Power Bi](https://github.com/user-attachments/assets/beae21d4-9b82-45cf-973d-a45bebaff5bb)


### Tables

- fact_sales  
- dim_product  
- dim_customer  
- dim_location  
- dim_payment  
- dim_status  
- dim_date  

### Relationships

- One-to-Many (dimension → fact)  
- Single-direction filtering  
- Optimized for performance and clarity  


---


## 3️⃣ Time Intelligence

A dedicated Date Dimension enables:

- Month-over-Month comparison  
- Trend analysis over time  
- Quarterly performance analysis  
- Rolling average calculations  

This enables dynamic time-based analytics instead of static reporting.


---


# 📊 Dashboard — Amazon Sales Performance & Cancellation Insights 2025

![Amazon Sales Performance   Cancellation Insights 2025](https://github.com/user-attachments/assets/78832c00-8e9e-4bb6-9130-c340c04d82ab)


The dashboard is structured into two primary analytical domains:

- Sales Performance  
- Cancellation Insights  

It provides both operational visibility and strategic-level insight into revenue performance and cancellation risk.


---


## 🔹 Sales Performance

### Key KPIs

- **Total Revenue:** $243.85K  
- **Total Orders:** 250  
- **Units Sold:** 714  
- **Average Order Value:** 975.38  
- **Cancellation Rate:** 30.8%  

Month-over-Month indicators are included to track short-term performance changes.


---


### Revenue Performance Over Time

The revenue trend visualization includes:

- Daily revenue  
- 7-day moving average (7D Avg)  

The 7-day average smooths daily volatility and highlights underlying performance trends.

This allows stakeholders to:
- Detect revenue fluctuations
- Identify short-term performance shifts
- Monitor consistency in daily sales


---


### Revenue by Category

Revenue contribution by product category:

- Electronics (~$130K)
- Home Appliances (~$105K)
- Footwear (~$4K)
- Clothing (~$4K)
- Books (~$1K)

**Business Insight:**

- Electronics and Home Appliances contribute the vast majority of total revenue.
- Lower-performing categories have minimal revenue impact.
- Revenue concentration indicates reliance on specific product segments.


---


### Top 5 Revenue by Location

Top-performing cities:

- Miami (~$31.7K)
- Denver (~$29.8K)
- Houston (~$28.4K)
- Dallas (~$27.1K)
- Seattle (~$26.9K)

**Business Insight:**

- Revenue distribution across top cities is relatively balanced.
- Some regions slightly outperform others in contribution.
- Geographic performance monitoring supports regional strategy decisions.


---


## 🔹 Cancellation Insights

### Order Status Distribution

Orders are distributed across three statuses:

- Completed (~35.2%)
- Pending (~34%)
- Cancelled (~30.8%)

**Insight:**

A cancellation rate of nearly one-third indicates a significant operational risk.


---


### Cancellation Rate by Payment Method

- Gift Card (~42.9%)
- Debit Card (~37.7%)
- Credit Card (~29.6%)
- PayPal (~26.7%)
- Amazon Pay (~17.1%)

**Business Insight:**

- Gift Card transactions show the highest cancellation probability.
- Amazon Pay demonstrates the lowest cancellation rate.
- Payment method strongly influences order reliability.


---


### Cancellation Rate by Category

- Home Appliances (~40%)
- Clothing (~32.5%)
- Footwear (~29.6%)
- Books (~28%)
- Electronics (~28%)

**Business Insight:**

- Home Appliances has the highest category-level cancellation rate.
- Certain product categories present higher fulfillment or transaction risk.


---


### Cancellation Root Cause Analysis (Category × Payment)

The matrix highlights high-risk combinations between product category and payment method.

Examples of elevated cancellation risk:

- Clothing + Gift Card (~80%)
- Books + Gift Card (~75%)
- Home Appliances + PayPal (~46.2%)
- Footwear + Debit Card (~60%)

**Strategic Insight:**

Specific category–payment combinations significantly increase cancellation probability, suggesting:

- Potential fraud exposure
- Payment reliability issues
- Operational inefficiencies
- Customer intent variability


---


# 🎯 Business Questions Answered

This dashboard enables stakeholders to answer:

- Which product categories generate the most revenue?
- How stable is revenue performance over time?
- Which regions contribute the most revenue?
- Is the cancellation rate a significant business risk?
- Which payment methods increase cancellation probability?
- Which product–payment combinations require risk mitigation?


---


# 🚀 Analytical Impact

This dashboard transforms raw transactional data into:

- Executive-level performance visibility  
- Operational risk monitoring  
- Payment behavior insights  
- Category-level risk diagnostics  
- Data-driven strategic decision support  


---


# 👤 Author

**Grittapop**  
Data Engineer | Analytics Engineer | Data Analyst  
Portfolio Project

