/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?

- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries

Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analysis
*/

WITH SKILLS_DEMAND AS (
    SELECT
        SKILLS_DIM.SKILL_ID,
        SKILLS_DIM.SKILLS,
        COUNT(SKILLS_JOB_DIM.JOB_ID) AS DEMAND_COUNT
    FROM
        JOB_POSTINGS_FACT
        INNER JOIN SKILLS_JOB_DIM
        ON JOB_POSTINGS_FACT.JOB_ID = SKILLS_JOB_DIM.JOB_ID
        INNER JOIN SKILLS_DIM
        ON SKILLS_JOB_DIM.SKILL_ID = SKILLS_DIM.SKILL_ID
    WHERE
        JOB_TITLE_SHORT = 'Data Analyst'
        AND SALARY_YEAR_AVG IS NOT NULL
        AND JOB_WORK_FROM_HOME = TRUE
    GROUP BY
        SKILLS_DIM.SKILL_ID
), AVERAGE_SALARY AS (
    SELECT
        SKILLS_JOB_DIM.SKILL_ID,
        ROUND(AVG(SALARY_YEAR_AVG),
        0) AS AVG_SALARY
    FROM
        JOB_POSTINGS_FACT
        INNER JOIN SKILLS_JOB_DIM
        ON JOB_POSTINGS_FACT.JOB_ID = SKILLS_JOB_DIM.JOB_ID
        INNER JOIN SKILLS_DIM
        ON SKILLS_JOB_DIM.SKILL_ID = SKILLS_DIM.SKILL_ID
    WHERE
        JOB_TITLE_SHORT = 'Data Analyst'
        AND SALARY_YEAR_AVG IS NOT NULL
        AND JOB_WORK_FROM_HOME = TRUE
    GROUP BY
        SKILLS_JOB_DIM.SKILL_ID
)
SELECT
    SKILLS_DEMAND.SKILL_ID,
    SKILLS_DEMAND.SKILLS,
    DEMAND_COUNT,
    AVG_SALARY
FROM
    SKILLS_DEMAND
    INNER JOIN AVERAGE_SALARY
    ON SKILLS_DEMAND.SKILL_ID = AVERAGE_SALARY.SKILL_ID
WHERE
    DEMAND_COUNT > 10
ORDER BY
    AVG_SALARY DESC,
    DEMAND_COUNT DESC LIMIT 25;