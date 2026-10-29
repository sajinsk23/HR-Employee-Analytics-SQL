# HR & Employee Analytics | SQL & Power BI

## Project Overview
This project analyzes fictional employee data using MySQL and Microsoft Power BI to uncover insights into employee demographics, departmental distribution, salary trends, employment status, performance ratings, and payroll allocation.

The project uses a sample dataset of 10 employees. SQL is used for data querying and analysis, while Power BI is used to build an interactive dashboard that presents key HR metrics and departmental insights visually.

## Objectives
- Analyse employee demographics and departmental distribution.
- Calculate average, minimum, and maximum salaries.
- Compare salaries across departments.
- Examine employee performance ratings.
- Analyse salary rankings and payroll distribution.
- Use SQL window functions and subqueries to generate insights.

## Tools and Technologies
- MySQL
- MySQL Workbench
- SQL
- Microsoft Power BI Desktop
- Visual Studio Code

## Database Structure
**Database:** `hr_analytics`

**Table:** `employees`

The table contains the following fields:

- `employee_id`
- `first_name`
- `last_name`
- `gender`
- `department`
- `job_title`
- `hire_date`
- `salary`
- `performance_rating`
- `employment_status`

## SQL Concepts Demonstrated
- `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT`
- Aggregate functions: `COUNT`, `AVG`, `SUM`, `MIN`, and `MAX`
- `GROUP BY` and `HAVING`
- Conditional logic using `CASE`
- Subqueries
- Common table expressions and joins, where applicable
- Window functions such as `RANK`, `DENSE_RANK`, `LAG`, and running totals
- Salary comparisons and payroll analysis

## Key Findings
Based on the sample dataset:

- Total employees: 10
- Average salary: 66,300
- Highest salary: 90,000
- Lowest salary: 45,000
- Total salary amount: 663,000
- Active employees: 9
- Inactive employees: 1
- Analytics has the largest departmental payroll, at 218,000.

*Salary figures are illustrative and use no explicitly specified currency.*

## Project Files
- `hr_analytics_rebuilt.sql` — Reconstructed SQL script containing database setup, sample data, and analysis queries.
- `hr_analytics_queries.sql` — Original file currently containing the final analysis query.
- `README.md` — Project documentation.
- `HR Employee Analytics Dashboard Screenshot` — Screenshot of the Power BI HR & Employee Analytics Dashboard

## How to Use
1. Install MySQL Server and MySQL Workbench.
2. Open the SQL script in MySQL Workbench.
3. Review the database setup, table definition, sample data, and analysis queries.
4. Execute the setup and data insertion sections only when appropriate for your database.
5. Run individual analysis queries to explore the results.

**Important:** The sample data uses fixed employee IDs. If those records already exist, running the insertion statement again will cause duplicate-key errors. The script does not need to be executed from top to bottom to run individual analysis queries.

## Disclaimer
This project uses fictional employee records for educational and portfolio purposes. It does not contain real employee or company data.

## Author
Sajin SK
