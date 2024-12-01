/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/


SELECT
    SKILLS,
    COUNT(SKILLS_JOB_DIM.JOB_ID) AS DEMAND_COUNT
FROM
    JOB_POSTINGS_FACT
    INNER JOIN SKILLS_JOB_DIM
    ON JOB_POSTINGS_FACT.JOB_ID = SKILLS_JOB_DIM.JOB_ID
    INNER JOIN SKILLS_DIM
    ON SKILLS_JOB_DIM.SKILL_ID = SKILLS_DIM.SKILL_ID
WHERE
    JOB_TITLE_SHORT = 'Data Analyst'
    AND JOB_WORK_FROM_HOME = TRUE
GROUP BY
    SKILLS
ORDER BY
    DEMAND_COUNT DESC LIMIT 5;