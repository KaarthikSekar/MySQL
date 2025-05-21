SELECT *
FROM Parks_and_Recreation.employee_demographics;

SELECT first_name, 
last_name,
 age,
 age + 10
FROM Parks_and_Recreation.employee_demographics;

# pemdas

SELECT employee_id,
first_name, age FROM Parks_and_Recreation.employee_demographics;


# WHERE Clause  
SELECT * FROM employee_salary WHERE first_name = "Leslie" AND salary >= 50000;


SELECT * FROM employee_salary WHERE
salary >= 50000;

SELECT * FROM employee_demographics
WHERE (first_name = "Leslie" AND age > 35) or last_name = "knope"
;

-- this will give us anything that contains jer followed by anything ( % - means anything ) 
SELECT * FROM employee_demographics
WHERE first_name LIKE "jer%"
;

-- this will give us the anything that has the li in it  
SELECT * FROM employee_demographics
WHERE first_name LIKE "%li%"
;

-- if you want to grab everyone name with a followed by anything
SELECT * FROM employee_demographics
WHERE first_name LIKE "a%" ;

-- if you want specific followed by no of characters use this 2 underscore -> anything that starts with a followed by two characters so basically three letter name
SELECT * FROM employee_demographics
WHERE first_name LIKE "a__" ;


-- Group by - groups together rows that have same values in spcified columns 
SELECT * FROM employee_demographics;

-- You can run aggregate function on this group by things avg - average, max- giving max value, 
-- min - minimum value, count - counting out the no

SELECT gender, avg(age) 
FROM employee_demographics 
GROUP BY gender;

SELECT occupation, salary
FROM employee_salary where salary > 50000
GROUP BY occupation, salary;

-- giving us the count of total no of occupations 
SELECT occupation, COUNT(occupation)
FROM employee_salary 
GROUP BY occupation;

select count(*)
FROM employee_salary;

-- ORDER BY - Simply ordering the elements in ascending or descending 
SELECT age, gender
FROM employee_demographics ORDER BY gender, age;

-- Basic SELECT & WHERE
-- Find all female employees.
-- List all employees who are older than 40.
-- Show the full name and age of employees born after 1985.

SELECT first_name, gender
 FROM employee_demographics where gender = "female";
 
 select employee_id, first_name, age 
 from employee_demographics where age > 40;
 
  select *
 from employee_demographics ;
 
 select first_name, last_name, birth_date
 from employee_demographics where birth_date > "1985-01-01";
 
--  GROUP BY and Aggregate Functions
-- Find the average age of employees by gender.
-- How many employees work in each department?
-- Find the highest and lowest salaries in each occupation.

Select avg(age), gender from employee_demographics group by gender;

select occupation, count(employee_id)
from employee_salary 
group by occupation;

select first_name, max(salary) 
from employee_salary 
group by first_name;

select first_name, avg(salary) as avg_salary
from employee_salary 
group by first_name
having avg(salary) > 55000;

-- having -- filtering out after aggregate function 
select occupation, avg(salary) 
from employee_salary
where occupation like "%manager"
group by occupation;

-- limit and aliasing 
select * 
from employee_demographics
limit 5;

select first_name, salary from employee_salary 
where salary > 50000 and first_name like "%a%"
order by salary
limit  5;

-- aliasing  - way to change the column name 
select gender, avg(age) as average_age
from employee_demographics
group by gender
having average_age > 40;

-- inner join 
select * 
from employee_demographics;

select * 
from employee_salary;

select dem.first_name, sal.salary 
from employee_demographics as dem
join employee_salary as sal 
	on dem.first_name = sal.first_name
where sal.salary > 50000 and dem.first_name like "%a%";

select dem.employee_id, dem.first_name, sal.occupation 
from employee_demographics as dem
join employee_salary as sal 
	on dem.first_name = sal.first_name
where sal.occupation like "%manager%"
limit 2;


select department_id
from parks_departments;

select * from employee_salary;


select 
	sal.dept_id, 
	count(sal.employee_id) as emp_count , 
	pd.department_name
from employee_salary as sal 
join parks_departments as pd
	on sal.dept_id = pd.department_id
group by sal.dept_id, pd.department_name;


SELECT first_name, last_name, "old" as label
FROM employee_demographics
WHERE age > 50
UNION 
select first_name, last_name, "Highly paid " as label
from employee_salary
where salary > 60000;



