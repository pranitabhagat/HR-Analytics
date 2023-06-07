#Creating database HR

create database HR;
use HR;
show tables;
select * from employee_attrition;
select count(*) from employee_attrition; #1470
 
#Checking unique values
select distinct department from employee_attrition; # 3- nice to plot
select distinct EducationField from employee_attrition; #6- nice to plot
select distinct JobLevel from employee_attrition; #5- nice to plot 
select distinct JobRole from employee_attrition; #7- nice to plot
select distinct PerformanceRating from employee_attrition; #2
select distinct BusinessTravel from employee_attrition; #3

#1. employees under attrition having 5+ years of experience in between the age group of 27-35

select count(*)
from employee_attrition
where age between 27 and 35 
and TotalWorkingYears >= 5;  #count 455

#2. details of employees having max & min salary working different dept who received less than 20% salary hike

select department,
	max(MonthlyIncome),
	min(MonthlyIncome)
from employee_attrition
where percentsalaryhike < 20
group by department
order by max(MonthlyIncome) desc;

#3.  monthly income of all employees who worked more than 3 years whose education background is medical

select avg(MonthlyIncome)
from employee_attrition
where Yearsatcompany > 3 
and EducationField = 'medical';

#4. total number of male and female employees under attrition whose Marital Status is married and haven't received promotion in last 2 years
	
select count(EmployeeNumber) as COUNT,
	gender, 
	MaritalStatus
from employee_attrition
where MaritalStatus = 'Married' and
YearsSinceLastPromotion > 2
and Attrition = 'Yes'
group by gender;

#5. employees with maximum performance ratings but no promotion for 4 years and above

select * from employee_attrition
where PerformanceRating = (select max(PerformanceRating) from employee_attrition) 
and  YearsSinceLastPromotion >= 4; #54
    
 #6. Who has max and min percentage salary hike
 
 select YearsAtCompany, PerformanceRating, YearsSinceLastPromotion, 
	max(PercentSalaryHike),
    min(PercentSalaryHike)
from employee_attrition
group by YearsAtCompany, PerformanceRating, YearsSinceLastPromotion
order by max(PercentSalaryHike) desc, min(PercentSalaryHike) asc;

#7. employees working overtime but given min salary hike and are more than 5 years with company

select * from employee_attrition
where OverTime = 'Yes'
and PercentSalaryHike = (select min(PercentSalaryHike) from employee_attrition)
and YearsAtCompany > 5;

select * from employee_attrition
where OverTime = 'No'
and PercentSalaryHike = (select max(PercentSalaryHike) from employee_attrition)
and YearsAtCompany < 5;

