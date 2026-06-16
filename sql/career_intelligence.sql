CREATE TABLE jobs (
    job_id BIGINT PRIMARY KEY,
    company TEXT,
    job_title TEXT,
    job_description TEXT,
    location TEXT,
    job_type TEXT,
    remote_allowed NUMERIC,
    min_salary NUMERIC,
    max_salary NUMERIC,
    applies NUMERIC,
    avg_salary NUMERIC,
    technical_skills_text TEXT
);

SELECT COUNT(*) FROM jobs;

SELECT * FROM jobs LIMIT 10;

SELECT 
COUNT(*) AS total_jobs,
COUNT(avg_salary) AS jobs_with_salary,
COUNT(*) - COUNT(avg_salary) AS jobs_without_salary
FROM jobs;

DROP TABLE IF EXISTS jobs;

CREATE TABLE jobs (
    job_id BIGINT,
    company TEXT,
    job_title TEXT,
    job_description TEXT,
    location TEXT,
    job_type TEXT,
    remote_allowed NUMERIC,
    min_salary NUMERIC,
    max_salary NUMERIC,
    applies NUMERIC,
    avg_salary NUMERIC,
    technical_skills_text TEXT
);

SELECT COUNT(*) FROM jobs;