OCD Patient Healthcare Data Analysis — MySQL

This is a SQL-based data analysis project where I used **MySQL** to explore a dataset of 1,500 OCD patient records.

The main aim of this project was to practice SQL concepts such as `GROUP BY`, `AVG()`, `COUNT()`, CTEs, date functions, and filtering while working with a healthcare dataset.

Note: This dataset is anonymized/synthetic-style and is used only for educational and portfolio purposes. It should not be used for real medical or clinical decisions.

## Project Questions

In this project, I wanted to find answers to the following questions:

* How many male and female patients are in the dataset?
* What is the average obsession Y-BOCS score for each gender?
* What percentage of the total patients does each gender represent?
* How many new OCD diagnoses were recorded each month?
* Which type of obsession is most common?
* What is the average Y-BOCS obsession score for the most common obsession type?
* Which type of compulsion is most common?
* What is the average Y-BOCS compulsion score for the most common compulsion type?

Dataset

File: `ocd_patient.csv`

The dataset contains **1,500 patient records** with information such as:

| Column                     | Description                      |
| -------------------------- | -------------------------------- |
| Patient ID                 | Unique ID for each patient       |
| Age                        | Age of the patient               |
| Gender                     | Male / Female                    |
| Ethnicity                  | Patient ethnicity                |
| Marital Status             | Marital status                   |
| Education Level            | Highest education level          |
| OCD Diagnosis Date         | Date when OCD was diagnosed      |
| Duration of Symptoms       | Duration of symptoms in months   |
| Previous Diagnoses         | Previous mental health diagnoses |
| Family History of OCD      | Yes / No                         |
| Obsession Type             | Type of obsessive thoughts       |
| Compulsion Type            | Type of compulsive behaviour     |
| Y-BOCS Score (Obsessions)  | Obsession severity score         |
| Y-BOCS Score (Compulsions) | Compulsion severity score        |
| Depression Diagnosis       | Yes / No                         |
| Anxiety Diagnosis          | Yes / No                         |
| Medications                | Medication class                 |

Tools Used

1. MySQL 8.0
2. MySQL Workbench
3. SQL

This is a pure SQL project, so I didn't use Python or any external libraries for the analysis.

Project Structure

```text
OCD-Healthcare-Data-Analysis/
│
├── ocd_patient.csv
├── Healthcare_Data_Analysis.sql
└── README.md
```

How I Ran the Project

First, I created a database in MySQL:

```sql
CREATE DATABASE project1;
USE project1;
```

Then I imported the `ocd_patient.csv` file into a table called:

```text
ocd_patient
```

After importing the data, I ran the queries from `Healthcare_Data_Analysis.sql` in MySQL Workbench.

One of the queries also converts the diagnosis date from the original text format into a proper MySQL `DATE` format so that I could perform monthly analysis.

Analysis Performed

 1. Gender and Obsession Severity

I grouped the patients by gender and calculated:

* Number of patients
* Average Y-BOCS obsession score

SQL concepts used:

```text
GROUP BY
COUNT()
AVG()
```

2. Gender Percentage

I calculated how much of the total patient population each gender represents.

For this, I used a **CTE** and calculated the percentage using the total number of patients.

3. Monthly OCD Diagnoses

The diagnosis date was originally stored in `MM/DD/YYYY` format.

I converted it into a proper `DATE` value using:

```sql
STR_TO_DATE()
```

Then I grouped the records by month using:

```sql
DATE_FORMAT()
```

This helped me see how the number of new diagnoses changed over time.

4. Most Common Obsession

I grouped patients based on their obsession type and counted the number of patients in each category.

I then sorted the results and used:

```sql
ORDER BY
LIMIT 1
```

to find the most common obsession type.

I also calculated its average obsession Y-BOCS score.

5. Most Common Compulsion

I followed a similar approach for compulsion types.

The analysis shows:

* The most common compulsion type
* Number of patients with that compulsion
* Average Y-BOCS compulsion score

What I Learned

Through this project, I practiced:

* Writing SQL queries
* Using aggregate functions
* Grouping and sorting data
* Working with dates in MySQL
* Using CTEs
* Calculating percentages
* Exploring healthcare-related datasets
* Turning SQL results into useful observations

Possible Improvements

If I continue working on this project, I would like to:

* Create visualizations using Tableau
* Analyze OCD severity by age group
* Compare patients with and without anxiety/depression
* Analyze medication types
* Explore the relationship between family history and OCD severity
* Create a dashboard using the SQL results


