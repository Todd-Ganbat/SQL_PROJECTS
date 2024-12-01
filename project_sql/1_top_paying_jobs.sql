/*
Question: What are the top-paying data analyst jobs?

- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).

Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities.
*/

SELECT
    JOB_ID,
    JOB_TITLE,
    JOB_LOCATION,
    JOB_SCHEDULE_TYPE,
    SALARY_YEAR_AVG,
    JOB_POSTED_DATE,
    NAME AS COMPANY_NAME
FROM
    JOB_POSTINGS_FACT
    LEFT JOIN COMPANY_DIM
    ON JOB_POSTINGS_FACT.COMPANY_ID = COMPANY_DIM.COMPANY_ID
WHERE
    JOB_TITLE_SHORT = 'Data Analyst'
    AND JOB_LOCATION = 'Anywhere'
    AND SALARY_YEAR_AVG IS NOT NULL
ORDER BY
    SALARY_YEAR_AVG DESC LIMIT 10;