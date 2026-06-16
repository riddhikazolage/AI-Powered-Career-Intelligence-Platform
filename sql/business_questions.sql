--TOP JOB ROLES

SELECT job_title, COUNT(*) AS total_jobs
FROM jobs
GROUP BY job_title
ORDER BY total_jobs DESC
LIMIT 10;

--TOP HIRING LOCATIONS

SELECT location, COUNT(*) AS total_jobs
FROM jobs
GROUP BY location
ORDER BY total_jobs DESC
LIMIT 10;

--TOP HIRING COMPANIES

SELECT company, COUNT(*) AS total_jobs
FROM jobs
GROUP BY company
ORDER BY total_jobs DESC
LIMIT 10;

--AVERAGE SALARY BY ROLE

SELECT job_title, ROUND(AVG(avg_salary), 2) AS avg_salary
FROM jobs
WHERE avg_salary IS NOT NULL
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;

--REMOTE VS NON-REMOTE JOBS

SELECT remote_allowed, COUNT(*) AS total_jobs
FROM jobs
GROUP BY remote_allowed;

--HIGHEST PAYING LOCATIONS

SELECT location, ROUND(AVG(avg_salary), 2) AS avg_salary
FROM jobs
WHERE avg_salary IS NOT NULL
GROUP BY location
ORDER BY avg_salary DESC
LIMIT 10;

--JOB TYPE DISTRIBUTION

SELECT job_type, COUNT(*) AS total_jobs
FROM jobs
GROUP BY job_type
ORDER BY total_jobs DESC;

--MOST APPLIED JOBS

SELECT job_title, company, location, applies
FROM jobs
WHERE applies IS NOT NULL
ORDER BY applies DESC
LIMIT 10;

--FRESHER FRIENDLY ROLES

SELECT job_title, company, location, job_type
FROM jobs
WHERE LOWER(job_title) LIKE '%junior%'
   OR LOWER(job_title) LIKE '%entry%'
   OR LOWER(job_title) LIKE '%intern%'
   OR LOWER(job_title) LIKE '%associate%'
LIMIT 20;

--TOP JOBS REQUIRING SQL

SELECT job_title, company, location, technical_skills_text
FROM jobs
WHERE LOWER(technical_skills_text) LIKE '%sql%'
LIMIT 20;

--TOP JOBS REQUIRING PYTHON

SELECT job_title, company, location, technical_skills_text
FROM jobs
WHERE LOWER(technical_skills_text) LIKE '%python%'
LIMIT 20;

--SQL VS PYTHON DEMAND

SELECT 
COUNT(CASE WHEN LOWER(technical_skills_text) LIKE '%sql%' THEN 1 END) AS sql_jobs,
COUNT(CASE WHEN LOWER(technical_skills_text) LIKE '%python%' THEN 1 END) AS python_jobs
FROM jobs;

--POWER BI VS TABLEAU DEMAND

SELECT 
COUNT(CASE WHEN LOWER(technical_skills_text) LIKE '%power bi%' THEN 1 END) AS powerbi_jobs,
COUNT(CASE WHEN LOWER(technical_skills_text) LIKE '%tableau%' THEN 1 END) AS tableau_jobs
FROM jobs;

--AVERAGE SALARY OF SQL JOBS VS PYTHON JOBS

SELECT 
ROUND(AVG(CASE WHEN LOWER(technical_skills_text) LIKE '%sql%' THEN avg_salary END), 2) AS avg_salary_sql_jobs,
ROUND(AVG(CASE WHEN LOWER(technical_skills_text) LIKE '%python%' THEN avg_salary END), 2) AS avg_salary_python_jobs
FROM jobs
WHERE avg_salary IS NOT NULL;

--BEST JOBS BASED ON SALARY AND APPLICATIONS

SELECT job_title, company, location, avg_salary, applies, technical_skills_text
FROM jobs
WHERE avg_salary IS NOT NULL
  AND applies IS NOT NULL
ORDER BY avg_salary DESC, applies DESC
LIMIT 10;