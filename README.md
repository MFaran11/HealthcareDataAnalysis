# OCD Patient Healthcare Data Analysis (MySQL)

A SQL-based exploratory data analysis project on a dataset of Obsessive-Compulsive Disorder (OCD) patients, examining diagnosis patterns, symptom severity, and demographic trends using MySQL.

Problem Statement

Mental health conditions like OCD affect patients differently based on demographics, symptom type, and co-occurring diagnoses. Healthcare providers and researchers need to understand these patterns to improve diagnosis, treatment planning, and resource allocation.

This project analyzes a dataset of 1,500 OCD patient records to answer key questions:

- How is OCD distributed across genders, and does symptom severity (Y-BOCS score) differ between them?
- What percentage of the total patient population does each gender represent?
- How have new OCD diagnoses trended month-over-month?
- What is the most common type of obsession reported, and how severe are its symptoms on average?
- What is the most common type of compulsion reported, and how severe are its symptoms on average?

The goal is to transform raw patient records into clear, actionable insights using SQL queries.

## 📂 Dataset

**File:** `ocd_patient.csv`

The dataset contains 1,500 anonymized patient records with the following fields:

| Column | Description |
|---|---|
| Patient ID | Unique identifier for each patient |
| Age | Patient's age |
| Gender | Male / Female |
| Ethnicity | Patient's ethnicity |
| Marital Status | Single, Married, Divorced, etc. |
| Education Level | Highest level of education completed |
| OCD Diagnosis Date | Date of OCD diagnosis (MM/DD/YYYY in raw file) |
| Duration of Symptoms (months) | How long symptoms have persisted |
| Previous Diagnoses | Prior mental health diagnoses (e.g., MDD, PTSD) |
| Family History of OCD | Yes/No |
| Obsession Type | Category of obsessive thoughts (e.g., Harm-related, Contamination) |
| Compulsion Type | Category of compulsive behavior (e.g., Checking, Washing) |
| Y-BOCS Score (Obsessions) | Yale-Brown Obsessive Compulsive Scale score for obsessions |
| Y-BOCS Score (Compulsions) | Yale-Brown Obsessive Compulsive Scale score for compulsions |
| Depression Diagnosis | Yes/No |
| Anxiety Diagnosis | Yes/No |
| Medications | Prescribed medication class (e.g., SSRI, SNRI, Benzodiazepine) |

> **Note:** This is a de-identified/synthetic-style dataset used for learning and portfolio purposes only. It should not be used for real clinical decision-making.

## 🛠️ Tools & Requirements

- **Database:** MySQL 8.0+
- **Client:** MySQL Workbench (or any MySQL-compatible client — DBeaver, CLI, etc.)
- **Language:** SQL

No external libraries or dependencies are required — this is a pure SQL project.

## 📁 Project Structure

```
├── ocd_patient.csv              # Raw dataset
├── Healthcare_Data_Analysis.sql # All analysis queries
└── README.md                    # Project documentation
```

## 🚀 How to Run

1. **Create a database and import the data**
   ```sql
   CREATE DATABASE project1;
   USE project1;
   ```
   Import `ocd_patient.csv` into a table named `ocd_patient` using MySQL Workbench's Table Data Import Wizard, or `LOAD DATA INFILE`.

2. **Run the analysis script**
   Open `Healthcare_Data_Analysis.sql` in MySQL Workbench and execute queries sequentially (top to bottom), since query 3 alters the schema (converts `OCD Diagnosis Date` to a proper `DATE` type) before later queries rely on it.

3. **Review results**
   Each query is commented with the business question it answers.

## 🔍 Analysis Breakdown

| # | Question | Approach |
|---|---|---|
| 1 | Patient count & avg obsession severity by gender | `GROUP BY` + `AVG()` |
| 2 | Gender distribution as a percentage of total patients | CTE + `JOIN` to compute percentage of total |
| 3 | Monthly trend of new diagnoses | Date type conversion (`STR_TO_DATE`, `ALTER TABLE`) + `DATE_FORMAT` + `GROUP BY` |
| 4 | Most common obsession type & its average severity | `GROUP BY` + `ORDER BY` + `LIMIT` |
| 5 | Most common compulsion type & its average severity | `GROUP BY` + `ORDER BY` + `LIMIT` |

## 📊 Key Insights *(fill in after running the queries on your machine)*

- Gender distribution: *e.g., ~50/50 split, with [gender] showing a slightly higher average obsession score*
- Diagnosis trend: *e.g., steady/increasing diagnoses between [year range]*
- Most common obsession type: *e.g., [type], avg Y-BOCS score of [X]*
- Most common compulsion type: *e.g., [type], avg Y-BOCS score of [X]*

## 📈 Future Improvements

- Add visualizations (Tableau / Power BI / Python matplotlib) on top of query outputs
- Analyze correlation between comorbid depression/anxiety and symptom severity
- Break down trends by medication type and treatment outcomes
- Segment analysis by age group and education level

## 🤝 Contributing

This is a personal learning/portfolio project, but suggestions and pull requests for additional queries or analysis angles are welcome.

## 📄 License

This project is for educational purposes. Dataset usage should comply with its original source's license terms.
