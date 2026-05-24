# Healthcare Operations & Discharge Analytics using SQL Server

## About the Project

This project focuses on performing **Healthcare Operations Analytics** using **MS SQL Server** on a real-world hospital dataset. The analysis was conducted from the perspective of a Data Analyst working for a fictional healthcare organization called **Auto Care Hospital**.

The dataset was collected from patients admitted over a two-year period between **1 April 2017 and 31 March 2019** at the Hero DMC Heart Institute, a unit of Dayanand Medical College and Hospital, Ludhiana, Punjab, India.

During the study period:

- **14,845 hospital admissions** were recorded
- Corresponding to **12,238 unique patients**
- Including **1,921 patients with multiple admissions**

The dataset contains detailed information related to patient admissions, discharge records, demographics, medical history, laboratory parameters, and cardiovascular conditions.

The primary objective of this project was to analyze discharge patterns, evaluate hospital operational efficiency, and derive meaningful healthcare insights using SQL-based analytical techniques.

---

## Dataset Overview

The dataset includes the following healthcare-related information:

### Patient & Admission Information

- Date of Admission
- Date of Discharge
- Admission Type (Emergency / Outpatient)
- Duration of Stay

### Patient Demographics

- Age
- Gender
- Rural / Urban Locality

### Medical History

- Diabetes Mellitus (DM)
- Hypertension (HTN)
- Coronary Artery Disease (CAD)
- Cardiomyopathy (CMP)
- Chronic Kidney Disease (CKD)
- Smoking History
- Alcohol Consumption

### Laboratory Parameters

- Hemoglobin (HB)
- Total Lymphocyte Count (TLC)
- Platelets
- Glucose
- Urea
- Creatinine
- Brain Natriuretic Peptide (BNP)
- Ejection Fraction (EF)

### Cardiovascular Conditions

- Heart Failure
- STEMI
- Pulmonary Embolism
- Other Comorbidities and Clinical Features

---

## Project Objectives

The objective of this project was to perform healthcare data analysis and evaluate key hospital discharge metrics using SQL.

The analysis focused on:

- Analyzing total patient discharges
- Measuring Average Length of Stay (ALOS)
- Calculating average discharge rates
- Evaluating discharge distribution across different age groups
- Analyzing discharge trends by gender
- Studying discharge patterns across weekdays
- Identifying duplicate admission records
- Creating reusable SQL views for analytical reporting
- Deriving operational healthcare insights from patient data

---

## SQL Concepts & Techniques Used

This project demonstrates the implementation of multiple SQL concepts commonly used in real-world analytics and data analysis workflows:

- **Common Table Expressions (CTEs)**
- **Window Functions (`ROW_NUMBER()`)**
- **Views**
- **Aggregate Functions (`SUM()`, `COUNT()`, `AVG()`)**
- **Conditional Logic using `CASE WHEN`**
- **Subqueries**
- **Data Cleaning & Deduplication**
- **Date Functions (`DATEPART()`, `FORMAT()`)**
- **Grouping & Aggregation (`GROUP BY`)**
- **Sorting & Ranking**
- **Business KPI Calculations**

---

## Key Business Metrics Analyzed

- Total Discharges
- Average Daily Discharge Rate
- Average Length of Stay (ALOS)
- Age-wise Discharge Distribution
- Gender-wise Patient Distribution
- Day-wise Discharge Trends
- Duplicate & Repeat Admissions

---

## Tools & Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Healthcare Analytics
- Data Cleaning & Data Analysis

---

## Future Enhancements

- Building interactive dashboards using Power BI
- Implementing advanced healthcare KPIs
- Performing patient readmission analysis
- Integrating predictive analytics using Python
- Applying query optimization techniques
- Developing an end-to-end healthcare analytics dashboard
