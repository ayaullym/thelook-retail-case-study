# 🛍️ The Look E-commerce — Retail Analytics Case Study

**Author:** Ayaulym Satybaldy  
**Tools:** SQL (Google BigQuery), Tableau Public, Python (validation), Excel  
**Dataset:** BigQuery Public Dataset — *thelook_ecommerce*  
**Time Period:** 2019–2024  

---

## 📌 Project Overview

This project is an **end-to-end retail analytics case study** built on a real-world e-commerce dataset.  
It demonstrates how structured data analysis supports **business decision-making** across pricing, merchandising, customer retention, and operational performance.

The analysis is structured around **three complementary perspectives**:

1. **Retail KPIs & operational health**  
2. **Product & category performance**  
3. **Customer value & behavior (RFM segmentation)**  

The focus is on **actionable insights**, not descriptive reporting.

---

## 🧰 Tools & Technologies

- **SQL (Google BigQuery)** — primary data modeling, aggregations, window functions  
- **Tableau Public** — dashboards and business storytelling  
- **Python (Jupyter Notebook)** — post-SQL validation and exploratory checks  
- **Excel** — intermediate exports  
- **Git & GitHub** — project structure and version control  

---

## 🔄 Analytical Workflow

1. **SQL (BigQuery)**  
   - Source of truth for all metrics and logic  
   - KPI aggregation, category performance, and RFM segmentation  

2. **Python (Validation)**  
   - Sanity checks on SQL outputs  
   - Segment distributions and metric consistency  
   - No transformation logic duplicated from SQL  

3. **Tableau (Insights & Decisions)**  
   - Visual storytelling for stakeholders  
   - KPI monitoring, risk detection, and strategic recommendations  

---

## Dashboards Overview

This project includes **three Tableau dashboards**, each answering a distinct business question.

---

## 1️⃣ Retail KPI Overview — Growth, Profitability & Operational Risk

🔗 **Tableau Public:**  
[View Retail KPI Overview](https://public.tableau.com/views/RetailKPIOverviewGrowthProfitabilityOperationalRisk/RetailKPIOverviewGrowthProfitabilityOperationalRisk)

### What this dashboard shows
- Monthly revenue trends  
- Orders vs units sold  
- Gross profit and margin stability  
- Operational health indicators (delivery time & return risk)  

### Key insights
- Revenue shows **steady growth with seasonal peaks**  
- Margins remain **stable despite increasing order volume**  
- Specific months exceed the **return-rate risk threshold**, signaling operational pressure  

### Business actions
- Monitor high return-rate periods for fulfillment or product issues  
- Maintain pricing discipline during growth phases  
- Use operational KPIs as **early-warning signals**, not lagging indicators  

---

## 2️⃣ Product & Category Performance

🔗 **Tableau Public:**  
[View Product & Category Performance](https://public.tableau.com/views/ProductCategoryPerformance_17708688410610/ProductCategoryDashboard)

### What this dashboard shows
- Revenue contribution by category  
- Profitability and margin efficiency  
- Category Risk Matrix (margin vs return rate)  

### Key insights
- A **small number of categories drive a disproportionate share of revenue**  
- Some high-revenue categories operate with **thinner margins**, increasing exposure  
- Categories with **high margin and high return rate** require closer review  

### Business actions
- Protect top revenue drivers through inventory and pricing optimization  
- Review sizing, quality, or return policies for high-return categories  
- Prioritize categories that balance **margin strength and low operational risk**  

---

## 3️⃣ RFM Customer Segmentation — Revenue & Value Analysis

🔗 **Tableau Public:**  
[View RFM Customer Segmentation](https://public.tableau.com/views/RFMCustomerSegmentationRevenueValueAnalysis/RFMCustomerSegmentationRevenueValueAnalysis)

### What this dashboard shows
- Customer segmentation using **Recency, Frequency, Monetary (RFM)** analysis  
- Revenue and customer distribution by segment  
- Segment Value Map (purchase frequency vs lifetime spend)  

### Key insights
- **Champions** are the smallest segment but generate the **highest lifetime value per customer**  
- **At Risk** customers represent the **largest segment** and the greatest churn exposure  
- **Potential Loyalists** offer strong upside with targeted engagement  

### Business actions
- **Champions:** retain via loyalty rewards, exclusives, and early access  
- **Potential Loyalists:** increase frequency with personalized promotions  
- **At Risk:** deploy re-engagement campaigns before churn becomes permanent  
- Shift focus from short-term revenue to **customer lifetime value optimization**  

---

##  RFM Methodology (Summary)

- **Recency:** Days since last purchase (lower = better)  
- **Frequency:** Total number of orders per customer  
- **Monetary:** Total lifetime spend per customer  

Customers were scored using quartiles and grouped into:

- Champions  
- Loyal Customers  
- Potential Loyalists  
- At Risk  

All segmentation logic was implemented in **SQL** and validated using Python.

---

##  Project Structure

```text
thelook-retail-case-study/
│
├── sql/                 # BigQuery SQL queries
├── data_exported_sql/   # SQL output datasets (Excel / CSV)
├── notebooks/           # Python validation notebooks
├── tableau/             # Tableau dashboards & screenshots
│   ├── screenshots/
│   └── README.md
└── README.md
