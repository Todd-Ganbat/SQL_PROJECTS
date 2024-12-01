# Introduction
Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

SQL queries? Check them out here: [project_sql folder](/project_sql/)
# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others' work to find optimal jobs.

### The question I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

**SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.

**PostgreSQL**: The chosen database management system, ideal for handling the job posting data.

**Visual Studio Code**: My go-to for database management and executing SQL queries.

**Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high-paying opportunities in the field.

```
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
```
Here's the breakdown of the top data analyst jobs in 2023:

- **Wide Salary Range**: Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field.
- **Diverse Employers**: Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety**: There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

![Top Paying Roles](assets%5C1_top_paying_roles.png)

### 2. Top Paying Data Analyst Job Skills

**Insights into the Top-Paying Roles**: 

- **Core Technical Skills Dominate**: SQL stands out as the most in-demand skill with the highest count, emphasizing its essential role in querying and managing data across industries.
Python, a versatile programming language, ranks second, highlighting its importance for data manipulation, analysis, and machine learning.
- **Visualization Tools Are Highly Valued**: Tableau and Excel feature prominently, indicating the demand for data analysts to effectively communicate insights through interactive dashboards and reports.
- **Statistical Analysis and Data Science Skills Are Crucial**: R, a tool known for statistical computing, demonstrates the need for expertise in advanced analytics and data modeling.
- **Cloud and Big Data Technologies Are Emerging**: Snowflake, a modern cloud-based data platform, showcases the growing demand for knowledge in handling large-scale and distributed datasets.
Azure, a major cloud computing platform, further underlines the shift toward cloud-based data solutions.
- **Collaboration and Version Control Skills Are Gaining Attention**: Tools like Bitbucket reflect the growing integration of data analytics into collaborative environments and workflows.
- **Programming Languages Like Go**: Although less in demand compared to others, Go signifies the rising interest in efficient, high-performance programming for large-scale data systems.

The chart below illustrates the top-paying roles for data analysts in 2023, highlighting the average salaries associated with each specialized skill

```
WITH TOP_PAYING_JOBS AS(
  SELECT
    JOB_ID,
    JOB_TITLE,
    SALARY_YEAR_AVG,
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
    SALARY_YEAR_AVG DESC LIMIT 10
)
SELECT
  TOP_PAYING_JOBS.*,
  SKILLS
FROM
  TOP_PAYING_JOBS
  INNER JOIN SKILLS_JOB_DIM
  ON TOP_PAYING_JOBS.JOB_ID = SKILLS_JOB_DIM.JOB_ID
  INNER JOIN SKILLS_DIM
  ON SKILLS_JOB_DIM.SKILL_ID = SKILLS_DIM.SKILL_ID
ORDER BY
  SALARY_YEAR_AVG DESC;
```
![Top Paying Skills](assets\2_top_paying_roles_skills.png)

### 3. Top demanding skills

**Insights from the Top 5 Skills for Data Analysts in 2023**:
- **High Demand for Core Technical Skills**: SQL leads with a significant demand count of 7,291, highlighting its foundational role in querying and managing databases for data analysts.
Python ranks third (4,330), emphasizing its popularity for data manipulation, analysis, and machine learning.
- **Business Tools Are Crucial**: Excel (4,611) is in second place, demonstrating its continued relevance for data organization and analysis despite the rise of advanced tools.
Power BI (2,609) and Tableau (3,745) show the growing importance of visualization tools in transforming raw data into actionable insights.
- **Combination of Programming and Visualization**: Employers prioritize candidates who can not only work with data programmatically (e.g., SQL, Python) but also present it effectively using visualization tools like Tableau and Power BI.
This trend underscores the value of blending technical and business-oriented skills to succeed as a data analyst.

```
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
```
![Top Demanding Skills](assets\3_top_demanding_skills.png)

### 4. Top paying skills

**Insights from the Top 10 Highest-Paying Skills for Data Analysts (2023)**: Big Data Tools Command Top Salaries: PySpark leads with the highest average salary of $208,172, highlighting its critical role in handling large-scale distributed data processing.
Other tools like Databricks and Couchbase reinforce the value of expertise in big data technologies.
- **DevOps and Collaboration Tools Are Highly Valued**: Bitbucket ($189,155) and GitLab ($154,500) showcase the growing demand for skills that bridge data analysis with software development workflows.
- **AI and Automation Play a Key Role**: AI tools like Watson ($160,515) and DataRobot ($155,486) underscore the increasing adoption of AI-driven platforms to enhance decision-making and automation in analytics.
- **Programming and Data Science Skills Remain Essential**: Skills like Swift ($153,750), Jupyter ($152,777), and Pandas ($151,821) highlight the need for versatile programming and data manipulation capabilities.
- **Search and Indexing Expertise Is Rewarded**: Elasticsearch ($145,000) represents the value of search engine technologies in data analytics, especially in unstructured data handling and fast information retrieval.
These trends emphasize the value of specialized skills in big data, DevOps, AI, and data science, along with a growing focus on cross-functional expertise for top-paying data analyst roles.

```
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
```
![Top Demanding Skills](assets\4_top_paying_skills.png)

### 5. Optimal Skills

**Insights from the Top 10 Skills for Data Analysts (2023)**:
- **High-Paying Specialized Skills**: Go commands the highest average salary of $115,320, reflecting its importance in developing efficient, high-performance applications.
Confluence ($114,210) and Hadoop ($113,193) indicate the value of collaboration tools and big data expertise in driving productivity and data scalability.
- **Demand vs. Salary**: Snowflake and Azure show higher demand counts (37 and 34, respectively) with competitive salaries ($112,948 and $111,225), indicating their widespread adoption in cloud and data warehousing.
- **Balanced Demand for Emerging Technologies**: Tools like BigQuery ($109,654) and AWS ($108,317) highlight the growing demand for cloud platforms.
Skills such as SSIS and Jira emphasize the importance of workflow management and data integration.
- **Data Analysts Need Cloud Expertise**: Snowflake, Azure, BigQuery, and AWS are prominent, demonstrating that proficiency in cloud technologies is a key differentiator in the job market.
- **Diverse Skill Requirements**: The list reflects a mix of programming (Go, Hadoop, Java), cloud technologies (Snowflake, Azure, AWS), and tools for collaboration and integration (Confluence, Jira, SSIS).
These trends highlight the demand for technical versatility, emphasizing both cloud-based and specialized technical skills for top-paying roles in data analytics.

```
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
```
![Top Optimal Skills](assets\5.top_optimal_skills.png)

# What I learned 

I’ve significantly improved my SQL skills through this project. I’ve learned to construct complex queries involving multiple tables and temporary tables. I’ve become proficient in using aggregate functions to summarize data. And I’ve honed my ability to translate real-world problems into effective SQL solutions.