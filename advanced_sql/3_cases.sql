SELECT
    COUNT(JOB_ID) AS NUMBER_OF_JOBS,
    CASE
        WHEN JOB_LOCATION = 'Anywhere' THEN
            'Remote'
        WHEN JOB_LOCATION = 'New York, NY' THEN
            'Local'
        ELSE
            'Onsite'
    END           AS LOCATION_CATEGORY
FROM
    JOB_POSTINGS_FACT
WHERE
    JOB_TITLE_SHORT = 'Data Analyst'
GROUP BY
    LOCATION_CATEGORY;

--
CREATE TABLE JANUARY_JOBS AS
    SELECT
        *
    FROM
        JOB_POSTINGS_FACT
    WHERE
        EXTRACT(MONTH FROM JOB_POSTED_DATE) = 1;

--
CREATE TABLE FEBRUARY_JOBS AS
    SELECT
        *
    FROM
        JOB_POSTINGS_FACT
    WHERE
        EXTRACT(MONTH FROM JOB_POSTED_DATE) = 2;

--
CREATE TABLE MARCH_JOBS AS
    SELECT
        *
    FROM
        JOB_POSTINGS_FACT
    WHERE
        EXTRACT(MONTH FROM JOB_POSTED_DATE) = 3;