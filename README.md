# BGV-workflow-Dashboard

# Background Verification (BGV) Data Analysis Project

##  Project Overview

This project focuses on analyzing and visualizing the end-to-end Background Verification (BGV) process for candidates. Using a dataset of 1000+ simulated records, the goal is to track verification statuses, identify discrepancies, and monitor turnaround time using SQL, Python, Power BI, and Tableau.

---

##  Objectives

- Automate the cleaning and transformation of BGV data using Python (Pandas)
- Store and query data using SQL to extract meaningful insights
- Build dynamic and interactive dashboards in Power BI and Tableau
- Identify inconsistent or suspicious verification records
- Improve decision-making with visual KPIs and trend analysis

---

## Tools & Technologies

- **Python (Pandas, NumPy)** – Data preprocessing & automation
- **SQL (MySQL )** – Data querying and analysis
- **Power BI** – Dashboard for business users
- **Excel** – Base data file for integration

---

## Dataset Description

**File:** `BGV_Verification_Data.xlsx`  
**Rows:** 1000+ candidate records  
**Key Columns:**
- `Candidate_ID`, `Name`, `Email`, `DOB`
- `Verification_Status` (Pending, Verified, Discrepancy)
- `Turnaround_Time_Days`
- `Employment_Check`, `Education_Check`, `Criminal_Record_Check`
- `Document_Issues_Flag`, `Report_Generated`

---

## Python Preprocessing Steps

# Load and preprocess data
import pandas as pd
df = pd.read_excel("BGV_Verification_Data.xlsx")

# Add inconsistency flag
df['Inconsistent_Flag'] = df.apply(
    lambda row: 1 if row['Employment_Check'] == "Fail" or row['Education_Check'] == "Fail" else 0,
    axis=1
)
Cleaned data is exported as Cleaned_BGV_Data.xlsx for use in SQL and BI tools.

# SQL Analysis Samples

-- Discrepancy count
SELECT COUNT(*) FROM bgv_data WHERE Verification_Status = 'Discrepancy';

-- Average Turnaround Time
SELECT AVG(Turnaround_Time_Days) FROM bgv_data;

-- Inconsistent records
SELECT * FROM bgv_data WHERE Inconsistent_Flag = 1;
** Power BI  Dashboards**
KPIs and Visuals:

Total candidates, Verified %, Discrepancy %

Avg Turnaround Time

Bar chart of verification statuses

Pie chart of criminal check results

Time-series of turnaround trends

Filters by date, status, and check results

**Key Insights**
Identified ~10% records with document issues or failed checks

Discrepancy rate found to be ~15%

Average turnaround time: ~12 days

Criminal record "clear" in 80% of cases

