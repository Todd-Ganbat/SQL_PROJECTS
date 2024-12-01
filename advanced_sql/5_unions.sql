-- Get jobs and companies from January
SELECT
    JOB_TITLE_SHORT,
    COMPANY_ID,
    JOB_LOCATION
FROM
    JANUARY_JOBS
UNION
ALL
 -- Get jobs and companies from February
SELECT
    JOB_TITLE_SHORT,
    COMPANY_ID,
    JOB_LOCATION
FROM
    FEBRUARY_JOBS
UNION
ALL -- combine another table
-- Get jobs and companies from March
SELECT
    JOB_TITLE_SHORT,
    COMPANY_ID,
    JOB_LOCATION
FROM
    MARCH_JOBS;