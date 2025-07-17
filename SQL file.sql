use BGV;

create table  BGV_workflow 
(
Candidate_ID int,
Name Varchar(50),
Email Varchar(50),
Phone Varchar(50),
DOB Varchar(50),
Verification_Status Varchar(50),
Turnaround_Time_Days Varchar(50),
Employment_Check Varchar(50),
Education_Check Varchar(50),
Criminal_Record_Check Varchar(50),
Document_Issues_Flag Varchar(50),
Report_Generated Varchar(50),
Inconsistent_Flag Varchar(50)
) ;
Alter table BGV_workflow 
modify Candidate_ID varchar(50);
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cleaned_BGV_Data.CSV'
INTO TABLE BGV_workflow
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 1. Total number of candidates
SELECT COUNT(*) FROM BGV_workflow;

-- 2. Count by verification status
SELECT Verification_Status, COUNT(*) FROM BGV_workflow GROUP BY Verification_Status;

-- 3. Discrepancy Rate
SELECT 
  (COUNT(CASE WHEN Verification_Status = 'Discrepancy' THEN 1 END) * 100.0) / COUNT(*) AS discrepancy_rate
FROM BGV_workflow;

-- 4. Avg turnaround by status
SELECT Verification_Status, AVG(Turnaround_Time_Days)
FROM BGV_workflow GROUP BY Verification_Status;

-- 5. Candidates with inconsistencies
SELECT * FROM BGV_workflow WHERE Inconsistent_Flag = 1;


