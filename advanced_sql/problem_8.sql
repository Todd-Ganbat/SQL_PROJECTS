/*
Find job postings from the first quarter that have a salary greater than $70K
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Gets job postings with an average yearly salary > $70,000
*/

SELECT
    QUARTER1_JOB_POSTINGS.JOB_TITLE_SHORT,
    QUARTER1_JOB_POSTINGS.JOB_LOCATION,
    QUARTER1_JOB_POSTINGS.JOB_VIA,
    QUARTER1_JOB_POSTINGS.JOB_POSTED_DATE::DATE,
    QUARTER1_JOB_POSTINGS.SALARY_YEAR_AVG
FROM
    (
        SELECT
            *
        FROM
            JANUARY_JOBS
        UNION
        ALL
        SELECT
            *
        FROM
            FEBRUARY_JOBS
        UNION
        ALL
        SELECT
            *
        FROM
            MARCH_JOBS
    ) AS QUARTER1_JOB_POSTINGS
WHERE
    QUARTER1_JOB_POSTINGS.SALARY_YEAR_AVG > 70000
    AND QUARTER1_JOB_POSTINGS.JOB_TITLE_SHORT = 'Data Analyst'
ORDER BY
    QUARTER1_JOB_POSTINGS.SALARY_YEAR_AVG DESC;