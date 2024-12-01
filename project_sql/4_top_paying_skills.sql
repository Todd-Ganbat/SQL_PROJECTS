/*
Answer: What are the top skills based on salary?

- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location

Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    SKILLS,
    ROUND (AVG(SALARY_YEAR_AVG),
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
 -- AND JOB_WORK_FROM_HOME = TRUE
GROUP BY
    SKILLS
ORDER BY
    AVG_SALARY DESC LIMIT 25;

/* 
Here are some quick insights into the trends observed in the top-paying skills for data analysts:

1. Big Data, Cloud, and AI Tools Dominate: Skills like PySpark, Databricks, and Watson highlight high demand for expertise in distributed computing, cloud platforms, and AI-driven analytics, commanding top salaries.

2. Integration of DevOps and Analytics: Tools such as Bitbucket, GitLab, and Jenkins showcase the rising importance of collaboration and workflow automation in data analytics roles.

3. Programming and Specialized Libraries: Proficiency in libraries like Pandas, NumPy, and machine learning tools such as scikit-learn remains critical for high-paying roles, emphasizing technical depth in data manipulation and modeling.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/