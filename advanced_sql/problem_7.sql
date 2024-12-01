/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
- Include skill ID, name, and count of postings requiring the skill
*/
WITH REMOTE_JOB_SKILLS AS (
    SELECT
        SKILL_ID,
        COUNT(*) AS SKILL_COUNT
    FROM
        SKILLS_JOB_DIM AS SKILLS_TO_JOB
        INNER JOIN JOB_POSTINGS_FACT AS JOB_POSTINGS
        ON JOB_POSTINGS.JOB_ID = SKILLS_TO_JOB.JOB_ID
    WHERE
        JOB_POSTINGS.JOB_WORK_FROM_HOME = TRUE
        AND JOB_POSTINGS.JOB_TITLE_SHORT = 'Data Analyst'
    GROUP BY
        SKILL_ID
)
SELECT
    SKILLS.SKILL_ID,
    SKILLS AS SKILL_NAME,
    SKILL_COUNT
FROM
    REMOTE_JOB_SKILLS
    INNER JOIN SKILLS_DIM AS SKILLS
    ON SKILLS.SKILL_ID = REMOTE_JOB_SKILLS.SKILL_ID
ORDER BY
    SKILL_COUNT DESC LIMIT 5;