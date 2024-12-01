/*
Find the companies that have the most job openings.
- Get the total number of job postings per company id (job_postings_fact)
- Return the total number of jobs with the company name (company_dim)
*/

WITH COMPANY_JOB_COUNT AS (
    SELECT
        COMPANY_ID,
        COUNT(*)   AS TOTAL_JOBS
    FROM
        JOB_POSTINGS_FACT
    GROUP BY
        COMPANY_ID
)
SELECT
    COMPANY_DIM.NAME             AS COMPANY_NAME,
    COMPANY_JOB_COUNT.TOTAL_JOBS
FROM
    COMPANY_DIM
    LEFT JOIN COMPANY_JOB_COUNT
    ON COMPANY_JOB_COUNT.COMPANY_ID = COMPANY_DIM.COMPANY_ID
ORDER BY
    TOTAL_JOBS DESC;