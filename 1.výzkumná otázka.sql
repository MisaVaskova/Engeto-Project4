SELECT 
    industry_branch_name,
    payroll_year,
    AVG(average_salary_per_year) AS average_salary_per_year,
    COALESCE(LAG(AVG(average_salary_per_year), 1) OVER (PARTITION BY industry_branch_name ORDER BY payroll_year), 0) AS previous_payroll_year,
    AVG(average_salary_per_year) - COALESCE(LAG(AVG(average_salary_per_year), 1) OVER (PARTITION BY industry_branch_name ORDER BY payroll_year), 0) AS payroll_change
FROM 
    t_Michaela_Vaskova_project_SQL_primary_final
GROUP BY 
    industry_branch_name, payroll_year
ORDER BY 
    industry_branch_name, payroll_year;
