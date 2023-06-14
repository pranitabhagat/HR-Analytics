## HR Analysis Project Using SQL Code

The following SQL code provides queries to perform analysis on HR data. The queries cover various aspects of employee attrition, department-wise salary information, education backgrounds, promotions, performance ratings, and other factors. Here is a breakdown of the queries and their purpose:

1. Counting employees under attrition with 5+ years of experience in the age group of 27-35:
   ```sql
   SELECT COUNT(*)
   FROM employee_attrition
   WHERE age BETWEEN 27 AND 35 
   AND TotalWorkingYears >= 5;
   ```
   This query counts the number of employees who are under attrition, have 5 or more years of experience, and fall within the age range of 27-35.

2. Details of employees with the maximum and minimum salary working in different departments, who received less than a 20% salary hike:
   ```sql
   SELECT department, MAX(MonthlyIncome), MIN(MonthlyIncome)
   FROM employee_attrition
   WHERE percentsalaryhike < 20
   GROUP BY department
   ORDER BY MAX(MonthlyIncome) DESC;
   ```
   This query retrieves the department-wise details of employees who received the highest and lowest salaries among those who had a salary hike of less than 20%.

3. Monthly income of all employees who have worked more than 3 years and have a medical education background:
   ```sql
   SELECT AVG(MonthlyIncome)
   FROM employee_attrition
   WHERE Yearsatcompany > 3 
   AND EducationField = 'medical';
   ```
   This query calculates the average monthly income of employees who have worked more than 3 years and have a medical education background.

4. Total number of male and female employees under attrition, whose marital status is married, and who haven't received a promotion in the last 2 years:
   ```sql
   SELECT COUNT(EmployeeNumber) AS COUNT, gender, MaritalStatus
   FROM employee_attrition
   WHERE MaritalStatus = 'Married'
   AND YearsSinceLastPromotion > 2
   AND Attrition = 'Yes'
   GROUP BY gender;
   ```
   This query provides the count of male and female employees who are under attrition, married, and haven't received a promotion in the last 2 years.

5. Employees with the maximum performance ratings but no promotion for 4 years and above:
   ```sql
   SELECT *
   FROM employee_attrition
   WHERE PerformanceRating = (SELECT MAX(PerformanceRating) FROM employee_attrition) 
   AND YearsSinceLastPromotion >= 4;
   ```
   This query retrieves the details of employees who have the highest performance rating but haven't received a promotion for 4 years or more.

6. Employees with the maximum and minimum percentage salary hike, grouped by years at the company, performance rating, and years since the last promotion:
   ```sql
   SELECT YearsAtCompany, PerformanceRating, YearsSinceLastPromotion, MAX(PercentSalaryHike), MIN(PercentSalaryHike)
   FROM employee_attrition
   GROUP BY YearsAtCompany, PerformanceRating, YearsSinceLastPromotion
   ORDER BY MAX(PercentSalaryHike) DESC, MIN(PercentSalaryHike) ASC;
   ```
   This query provides employees' information with the maximum and minimum percentage salary hike, grouped by years at the company, performance rating, and years since the last promotion.

7. Employees working overtime but given the minimum salary hike and have been with the company for more than 5 years:
   ```sql
   SELECT *
   FROM employee_attrition
   WHERE OverTime = 'Yes'
   AND PercentSalaryHike = (SELECT MIN(PercentSalaryHike) FROM

