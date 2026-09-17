# 🧵 Textile Sales Analytics: End-to-End BI Pipeline

[![Excel](https://img.shields.io/badge/Excel-Data_Cleaning-green.svg)](#) [![T-SQL](https://img.shields.io/badge/T--SQL-Database_Analysis-blue.svg)](#) [![Power BI](https://img.shields.io/badge/Power_BI-Interactive_Dashboard-yellow.svg)](#)

An end-to-end data analytics project examining textile trade sales performance across India. This repository covers raw data cleaning in Excel, exploratory and window-function analysis using SQL Server (T-SQL), and interactive visual reporting using Power BI.

---

## 📌 Executive Summary & Key Metrics

Analyzing **600 orders** across 12 Indian states, 10 products, and 12 major customers throughout 2026 yielded the following core business metrics:

* **Total Revenue:** ₹6.04 Cr
* **Total Orders:** 600 orders
* **Average Unit Price:** ₹295
* **Highest Order Value:** ₹4.10 Lakhs
* **Lowest Order Value:** ₹7,160
* **Cancellation & Return Rate:** 12.5%

---

## 🛠️ Tools & Tech Stack

| Analytics Stage | Tool / Technology | Objective & Tasks |
| :--- | :--- | :--- |
| **Data Cleaning** | Microsoft Excel | Audit trail preservation, casing standardization, fixing negative values, and resolving missing regions. |
| **Data Analysis** | SQL Server (T-SQL) | Aggregations, window functions (`RANK`, `DENSE_RANK`, `LAG`), time-series growth tracking, and view creation. |
| **Data Visualization** | Power BI (`.pbit`) | Interactive dashboard featuring KPI cards, regional maps, trend lines, top-N charts, and dynamic slicers. |

---

## 📂 Repository Structure

├── Sales_cleaned.csv                             # Cleaned & audit-ready dataset (600 rows, 25 columns)
├── SQLQueries.sql                                # T-SQL analysis queries, aggregations, & view creation
├── Textile_PowerBI.pbit                          # Power BI interactive dashboard template
├── SQL Usecase.pdf                               # Analysis requirements and query specifications
├── Textile_Sales_Project_Documentation.pdf       # End-to-end project documentation summary
└── README.md                                     # Project overview and documentation



---

## 🧹 Data Cleaning & Quality Assurance (Excel)

To preserve data auditability, original raw fields (`*_Raw`) were retained alongside standardized cleaned columns:

* **Text Standardizing:** Normalized casing across `Order_Status` (e.g., `delivered` to `Delivered`) and consolidated 10 inconsistent raw payment strings into 5 standardized categories (`UPI`, `Credit`, `Bank Transfer`, `Cash`, `Wallet`).
* **Missing Value Imputation:** Mapped 5 missing/error `Region` entries using corresponding `State` attributes.
* **Anomaly Corrections:** Replaced negative entries in `Quantity_Meters` with positive absolute values[cite: 1].
* **Sales Reconciliation:** Created a `Sales_Match` validation flag using `Gross Amount - Discount = Expected Sales`[cite: 1].

---

## 📊 SQL Analysis & Core Queries (T-SQL)

Analysis was executed on SQL Server against `[Textile_Sales].[dbo].[Textile]`[cite: 1]. Key query categories include:

* **Grouped Aggregates:** Total sales and order volumes broken down by Region, State, Fabric Type, Customer, and Product[cite: 1].
* **Window Functions:** Ranked top customers via `RANK()`, ordered product quantity via `DENSE_RANK()`, and calculated Month-over-Month growth via `LAG()`[cite: 1].
* **Reporting Layer:** Built the reusable `Cleaned_Textile_Sales_Data` view to ensure downstream BI tools always pull validated records[cite: 1].

### Sample Query: Month-over-Month Sales Growth
```sql
SELECT 
    Order_Year, 
    Order_Month, 
    SUM(Sales_Amount_Expected) AS Monthly_Sales,
    ((SUM(Sales_Amount_Expected) - LAG(SUM(Sales_Amount_Expected)) OVER (ORDER BY Order_Year, Order_Month)) 
     / LAG(SUM(Sales_Amount_Expected)) OVER (ORDER BY Order_Year, Order_Month)) * 100 AS Growth_Percentage 
FROM Textile 
GROUP BY Order_Year, Order_Month 
ORDER BY Order_Year, Order_Month;


📈 Key Insights
Regional Performance: The South region leads with ₹2.22 Cr (~37% of total sales), followed by the North region (₹1.87 Cr)[cite: 1]. East and West remain under-penetrated[cite: 1].

Product Drivers: Silk Fusion generated ₹1.31 Cr alone, outselling the second-ranked product by nearly 2x[cite: 1].

Fabric Demand: Cotton and Printed Cotton drive the highest volume in total meters sold, despite lower unit price points[cite: 1].

Top Customers: The top 3 accounts (Vardhan Textiles, Royal Weave Traders, LoomCraft India) contribute >₹1.78 Cr (~30% of overall revenue)[cite: 1].

Seasonality: Revenue peaks in January and October, with the lowest performance occurring in November[cite: 1].

Operational Risk: Cancelled and returned orders account for 12.5% of all orders, exceeding typical industry benchmarks (5–8%)[cite: 1].

💡 Recommendations
Reduce Return Rates: Audit pre-cleanup order statuses (Order_Status_Raw) to resolve root causes of cancellations and returns[cite: 1].

Geographic Expansion: Run targeted marketing campaigns in East (₹83.6 L) and West (₹1.08 Cr) regions to balance regional sales[cite: 1].

Upselling & Product Bundling: Bundle high-demand volume fabrics (Cotton) with high-margin fabrics (Silk Fusion, Linen Touch) to increase Average Order Value[cite: 1].   

ETL Automation: Migrate Excel cleaning rules (case mapping, negative quantity fixes) directly into the SQL ETL pipeline[cite: 1].   

🚀 Setup & Usage Instructions
Database Import:   

Import Sales_cleaned.csv into SQL Server[cite: 1].   

Run the script in SQLQueries.sql to execute queries and create the Cleaned_Textile_Sales_Data view[cite: 1].   

Power BI Dashboard:   

Open Textile_PowerBI.pbit in Power BI Desktop[cite: 1].   

Connect the template to your SQL database view to populate the interactive visuals[cite: 1].
