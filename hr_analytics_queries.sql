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









