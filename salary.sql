create database salary;
use salary;
select * from salaries;

-- 1. Find the Top 5 Highest-Paid Jobs
select company_name,job_title,location,max(salary) as highest_salary from salaries
group by company_name,job_title,location
order by highest_salary desc limit 5;

-- 2. Find the Average Salary for Each Job Title
select distinct job_title, round(avg(salary),2) as avg_salary from salaries
group by job_title
order by avg_salary desc;

-- 3. Find Companies Paying Above Average Salary
select company_name, round(avg(salary),2) as avg_salary from salaries
where salary > 'avg_salary'
group by company_name
order by avg_salary desc;

-- 4. Find the Lowest Salary for Each Job Title 
select distinct job_title, min(salary) as lowest_salary from salaries
group by job_title
order by lowest_salary asc;

-- 5. Count the Number of Employees in Each Job Title 
select distinct job_title, count(*) as num_employees from salaries
group by job_title
order by num_employees desc;

-- 6. Find the Highest-Paying Companies for a Specific Role 
select company_name, job_title, max(salary) as high_salary from salaries
group by company_name,job_title
order by high_salary desc;

-- 7. Rank Salaries Within Each Job Title 
select job_title,salary, rank() over(partition by job_title order by salary desc) as salary_rank
from salaries;

-- 8. Find the Salary Difference Between the Highest and Lowest Paid Job 
select (max(salary)-min(salary)) as salary_difference from salaries;

-- 9. Find the Percentage Increase from Lowest to Highest Salary in Each Job 
select job_title,max(salary) as high_salary,min(salary) as low_salary,
round(((max(salary) - min(salary))/min(salary))*100,2) as percentage_increase from salaries
group by job_title
order by percentage_increase desc;

-- 10. Identify the Most Common Job Locations 
select location,count(*) as num_jobs from salaries
group by location 
order by num_jobs desc;

-- 11. Find Salaries That Are in the Top 10% of the Dataset 
select * from salaries 
where salary >= ( select max(salary)*0.9 from salaries)
order by salary desc;

-- 12. Find the Company with the Most Employees Reported 
select company_name, sum(salaries_reported) as most_reported from salaries
group by company_name
order by most_reported desc limit 1;

-- 13. Find Salaries Reported by Companies in Multiple Locations 
select company_name, count(distinct location) as num_locations from salaries
group by company_name, 'num_locations'
having num_locations > 1;






