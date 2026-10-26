-- =====================================================
-- HR & EMPLOYEE ANALYTICS PROJECT
-- Database: hr_analytics
-- Table: employees
-- Purpose: Explore employee data using SQL
-- Queries completed: 30
-- =====================================================

-- =====================================================
-- SECTION 1: DATABASE SETUP
-- =====================================================

CREATE DATABASE IF NOT EXISTS hr_analytics;

USE hr_analytics;

-- =====================================================
-- SECTION 2: CREATE EMPLOYEES TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(20),
    department VARCHAR(50) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    performance_rating INT,
    employment_status VARCHAR(20) NOT NULL
);

-- =====================================================
-- SECTION 3: INSERT EMPLOYEE DATA
-- =====================================================

INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    gender,
    department,
    job_title,
    hire_date,
    salary,
    performance_rating,
    employment_status
)
VALUES
(101, 'Arjun', 'Kumar', 'Male', 'Analytics', 'Data Analyst', '2023-04-15', 65000, 4, 'Active'),
(102, 'Priya', 'Sharma', 'Female', 'Human Resources', 'HR Executive', '2022-08-10', 52000, 5, 'Active'),
(103, 'Rahul', 'Verma', 'Male', 'Finance', 'Financial Analyst', '2021-02-20', 72000, 4, 'Active'),
(104, 'Sneha', 'Reddy', 'Female', 'Analytics', 'Senior Data Analyst', '2020-11-05', 85000, 5, 'Active'),
(105, 'Vikram', 'Patel', 'Male', 'IT', 'IT Support Analyst', '2023-09-18', 48000, 3, 'Active'),
(106, 'Ananya', 'Nair', 'Female', 'Marketing', 'Marketing Executive', '2024-01-12', 45000, 4, 'Active'),
(107, 'Karthik', 'Rao', 'Male', 'Analytics', 'Business Analyst', '2022-05-25', 68000, 3, 'Active'),
(108, 'Meera', 'Iyer', 'Female', 'Finance', 'Accountant', '2019-07-30', 60000, 4, 'Inactive'),
(109, 'Aditya', 'Singh', 'Male', 'IT', 'Software Developer', '2021-12-01', 78000, 5, 'Active'),
(110, 'Divya', 'Menon', 'Female', 'Human Resources', 'HR Manager', '2018-03-14', 90000, 5, 'Active');

-- =====================================================
-- SECTION 4: BASIC DATA EXPLORATION
-- Steps 1-5
-- =====================================================

-- Step 1: Display all employee records
SELECT *
FROM employees;

-- Step 2: Select specific employee details
SELECT
    first_name,
    last_name,
    department,
    job_title
FROM employees;

-- Step 3: Filter employees by department
SELECT *
FROM employees
WHERE department = 'Analytics';

-- Step 4: Sort employees by salary (highest first)
SELECT
    first_name,
    last_name,
    department,
    salary
FROM employees
ORDER BY salary DESC;

-- Step 5: Display the five highest-paid employees
SELECT
    first_name,
    last_name,
    department,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- =====================================================
-- SECTION 5: AGGREGATE ANALYSIS
-- Steps 6-10
-- =====================================================

-- Step 6: Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Step 7: Calculate average salary
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;

-- Step 8: Find the highest salary
SELECT MAX(salary) AS highest_salary
FROM employees;

-- Step 9: Find the lowest salary
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- Step 10: Calculate total salary expenditure
SELECT SUM(salary) AS total_salary
FROM employees;

-- =====================================================
-- SECTION 6: DEPARTMENT ANALYSIS
-- Steps 11-13
-- =====================================================

-- Step 11: Count employees in each department
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC;

-- Step 12: Calculate average salary by department
SELECT
    department,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;

-- Step 13: Calculate total salary expenditure by department
SELECT
    department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

-- =====================================================
-- SECTION 7: FILTERING AND CONDITIONAL ANALYSIS
-- Steps 14-17
-- =====================================================

-- Step 14: Find employees earning more than 70,000
SELECT
    first_name,
    last_name,
    department,
    salary
FROM employees
WHERE salary > 70000
ORDER BY salary DESC;

-- Step 15: Find employees with a performance rating of 5
SELECT
    first_name,
    last_name,
    department,
    performance_rating
FROM employees
WHERE performance_rating = 5
ORDER BY department;

-- Step 16: Count employees by employment status
SELECT
    employment_status,
    COUNT(*) AS employee_count
FROM employees
GROUP BY employment_status;

-- Step 17: Categorise employees into salary bands
SELECT
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary < 50000 THEN 'Entry'
        WHEN salary < 70000 THEN 'Mid'
        ELSE 'High'
    END AS salary_band
FROM employees
ORDER BY salary;

-- =====================================================
-- SECTION 8: TENURE AND PERFORMANCE ANALYSIS
-- Steps 18-20
-- =====================================================

-- Step 18: Calculate employee tenure in years
SELECT
    first_name,
    last_name,
    department,
    hire_date,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS tenure_years
FROM employees
ORDER BY tenure_years DESC;

-- Step 19: Calculate average performance rating by department
SELECT
    department,
    ROUND(AVG(performance_rating), 2) AS average_rating
FROM employees
GROUP BY department
ORDER BY average_rating DESC;

-- Step 20: Find employees earning above their department's average salary
SELECT
    e.first_name,
    e.last_name,
    e.department,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department = e.department
)
ORDER BY e.department, e.salary DESC;

-- =====================================================
-- SECTION 9: RANKING AND WINDOW FUNCTIONS
-- Steps 21-24
-- =====================================================

-- Step 21: Rank employees by salary within each department
SELECT
    first_name,
    last_name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees
ORDER BY department, salary_rank;

-- Step 22: Calculate dense salary rankings within each department
SELECT
    first_name,
    last_name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees
ORDER BY department, salary_rank;

-- Step 23: Calculate a running total of salaries
SELECT
    first_name,
    last_name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary, employee_id
    ) AS running_salary_total
FROM employees
ORDER BY salary, employee_id;

-- Step 24: Compare each employee's salary with the previous employee
-- in salary order
SELECT
    first_name,
    last_name,
    salary,
    LAG(salary) OVER (
        ORDER BY salary, employee_id
    ) AS previous_salary,
    salary - LAG(salary) OVER (
        ORDER BY salary, employee_id
    ) AS salary_difference
FROM employees
ORDER BY salary, employee_id;

-- =====================================================
-- SECTION 10: ADVANCED SALARY AND PAYROLL ANALYSIS
-- Steps 25-30
-- =====================================================

-- Step 25: Find the second-highest salary
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- Step 26: Calculate each department's percentage of total payroll
SELECT
    department,
    SUM(salary) AS department_payroll,
    ROUND(
        SUM(salary) * 100.0 /
        (SELECT SUM(salary) FROM employees),
        2
    ) AS payroll_percentage
FROM employees
GROUP BY department
ORDER BY payroll_percentage DESC;

-- Step 27: Find each department's highest salary and the gap
-- between that salary and each employee's salary
SELECT
    first_name,
    last_name,
    department,
    salary,
    MAX(salary) OVER (
        PARTITION BY department
    ) AS department_max_salary,
    MAX(salary) OVER (
        PARTITION BY department
    ) - salary AS salary_gap
FROM employees
ORDER BY department, salary DESC;

-- Step 28: Compare each employee's salary with the overall average
SELECT
    first_name,
    last_name,
    department,
    salary,
    ROUND(
        salary - (SELECT AVG(salary) FROM employees),
        2
    ) AS difference_from_average
FROM employees
ORDER BY difference_from_average DESC;

-- Step 29: Calculate cumulative payroll by department
SELECT
    department,
    SUM(salary) AS department_payroll,
    SUM(SUM(salary)) OVER (
        ORDER BY SUM(salary) DESC, department
    ) AS cumulative_payroll
FROM employees
GROUP BY department
ORDER BY department_payroll DESC;

-- Step 30: Final report — employees earning above their
-- department average, ranked within their department
SELECT
    first_name,
    last_name,
    department,
    salary,
    average_salary,
    salary_rank
FROM (
    SELECT
        first_name,
        last_name,
        department,
        salary,
        AVG(salary) OVER (
            PARTITION BY department
        ) AS average_salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) AS employee_analysis
WHERE salary > average_salary
ORDER BY department, salary_rank;

