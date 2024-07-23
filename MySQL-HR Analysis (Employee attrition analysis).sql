
##**Employee Attrition Analysis Using MySQL**


#Q1.What is the Attrition rate for the entire company?
select tot_count,attrition_count,
(attrition_count/tot_count)*100 as attrition_rate
from
(select sum(case when attrition ='yes' then 1 else 0 end)as attrition_count,count(*)as tot_count
from hranalysis)as sub;

-- Create a view that includes the attrition rate
use hranalysis;

create view EmployeeAttrition as
select *, (case when Attrition = 'Yes' then 1 else 0 end) * 100 as AttritionRate
from hranalysis;

#Q2.What is the attrition rate by department?

select department,avg(attritionrate) as attrition_by_department
from EmployeeAttrition
group by department;

#Q3.What is the attrition rate for employees with different job roles?

select JobRole,
round(avg(Attritionrate)) as Attrition_by_jobrole
from EmployeeAttrition
group by JobRole
order by Attrition_by_jobrole desc;

#Q4.What is the attrition rate for employees who have been with the company for different lengths of time?

select YearsAtCompany ,
round(avg(Attritionrate),2)as Attrion_by_YearsAtCompany
from EmployeeAttrition
group by YearsAtCompany
order by YearsAtCompany;

#Q5.What is the attrition rate for employees with different levels of job satisfaction?

select JobSatisfaction ,
round(avg(attritionrate),2)as Attrition_rate_by_jobsatifaction
from EmployeeAttrition
group by JobSatisfaction
order by JobSatisfaction desc;

#Q6.What is the attrition rate for employees with different work-life balance levels?

select WorkLifeBalance ,
round(avg(attritionrate),2)as Attrition_by_Worklifebalance
from EmployeeAttrition
group by WorkLifeBalance;

#Q7.What is the attrition rate for employees with different distances from home?

select DistanceFromHome,
round(avg(attritionrate),2)as Attrition_by_DistanceFH
from EmployeeAttrition
group by DistanceFromHome
order by DistanceFromHome desc;

#Q8.What is the attrition rate for employees with different business travel frequencies?

select BusinessTravel,
round(avg(attritionrate),2)as attrition_by_BusinessTravel
from EmployeeAttrition
group by BusinessTravel
order by attrition_by_BusinessTravel desc;

#Q9.Is there a correlation between the percentage of salary hike and attrition rate?

select percentSalaryHike,
round(avg(attritionrate),2)as attrition_by_percentSalaryHike
from EmployeeAttrition
group by percentSalaryHike
order by percentSalaryHike desc;

#Q10.Do married employees have a different attrition rate compared to single employees?

select MaritalStatus,
round(avg(attritionrate),2)as attrition_by_percentSalaryHike
from EmployeeAttrition
group by Maritalstatus;

/**Q11.Are there any trends in salary hike percentages over the years 
among employees who stayed and those who left?**/

select YearsAtCompany,
round(avg(case when Attrition = 'Yes' then 1 else 0 end),2) AS AvgHikeForAttrition,
round(avg(case when Attrition = 'No' then 1 else 0 end),2) AS AvgHikeForRetention
from EmployeeAttrition
group by YearsAtCompany
order by YearsAtCompany;

#Q12.What are the key factors influencing attrition in different departments?

select Department,
avg(JobSatisfaction) as AvgJobSatisfaction,
avg(WorkLifeBalance) as AvgWorkLifeBalance,
avg(percentSalaryHike) as AvgSalaryHike,
avg(DistanceFromHome) as AvgDistanceFromHome,
avg(AttritionRate) as AvgAttritionRate
from EmployeeAttrition
group by Department;

#13. Which department has the highest average job satisfaction and what factors might contribute to it?
SELECT department,
       AVG(jobsatisfaction) AS avg_job_satisfaction,
       AVG(worklifebalance) AS avg_work_life_balance,
       AVG(monthlyincome) AS avg_monthly_income,
       AVG(trainingtimeslastyear) AS avg_training_times_last_year
FROM hranalysis
GROUP BY department
ORDER BY avg_job_satisfaction DESC
LIMIT 1;

#14. Are there any patterns in employee attrition related to age and years at the company?
select age,yearsatcompany,attritionrate from employeeattrition
order by yearsatcompany;

#15. Do employees with higher job involvement levels receive more frequent training?

select jobinvolvement,
       avg(trainingtimeslastyear) as avg_training_times
from hranalysis
group by jobinvolvement
order by jobinvolvement desc;





















