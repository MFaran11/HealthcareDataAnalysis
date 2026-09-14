SELECT * FROM project1.ocd_patient;

-- 1. Count of patients by 'gender' and their average obs score
SELECT 
	gender,
	COUNT(`Patient ID`) AS patient_count,
	ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score
FROM ocd_patient
group by Gender;

-- 2.From 1 above, calc the patient count percentage
WITH gender_count AS
	(SELECT 
		gender,
		COUNT(`Patient ID`) AS patient_count,
		ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score
FROM ocd_patient
GROUP BY Gender),
total AS
	(SELECT 
		SUM(patient_count) AS total_count
	FROM gender_count)
SELECT 
	g.gender,
	g.patient_count,
	g.avg_obs_score,
	ROUND((patient_count/t.total_count) * 100,2) AS percentage
FROM gender_count g
Join total t;

-- 3. Count of patients MoM
set sql_safe_updates = 0;

update ocd_patient
SET `OCD Diagnosis Date` = str_to_date(`OCD Diagnosis Date`, '%m/%d/%Y')
WHERE str_to_date(`OCD Diagnosis Date`, '%m/%d/%Y') is not null;

ALTER TABLE ocd_patient
MODIFY COLUMN `OCD Diagnosis Date` DATE;

SELECT 
	date_format(`OCD Diagnosis Date`,'%Y-%m-01 00:00:00') AS month,
    count(`Patient ID`) AS patient_count
from ocd_patient
group by month
order by month;

-- 4. The most common obssesion type and its avg obs score
SELECT 
	`Obsession Type`,
	COUNT(`Patient ID`) AS patient_count,
	ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score 
FROM ocd_patient
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 5. The most common complusion type and its avg comp score
SELECT 
	`Compulsion Type`,
	COUNT(`Patient ID`) AS patient_count,
	ROUND(AVG(`Y-BOCS Score (Compulsions)`),2) AS avg_comp_score
FROM ocd_patient
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

