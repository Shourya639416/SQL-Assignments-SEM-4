show databases;
create database kipilearn_day_1;
use kipilearn_day_1;
set sql_safe_updates=0;
 
create table employee_1
(
	EMPLOYEE_ID int primary key,
	Ename varchar(10) not null,
    Age int check(age between 18 and 60),
    Department varchar(10),
    Salary decimal(8),
    Joining_date date 
);

 desc employee_1;
-- EMPLOYEE_ID	 int	        NO	PRI		
-- Ename	     varchar(10)	NO			
-- Age	         int	        YES			
-- Department	 varchar(10)	YES			
-- Salary	     decimal(8,0)	YES			
-- Joining_date	 date	        YES	
		
insert into employee_1 values
('101','KIRAN','25','HR','50000','2020/01/15'),
('102','RAHUL','30','IT','60000','2019/06/20'),
('103','RIMA','35','FINANCE','70000','2018/07/10'),
('104','BABITA','40','MARKETING','80000','2021/03/25'),
('105','ARKA','28','IT','55000','2022/09/05');

-- 1. retrieve all columns and rows from employee_1 table.
SELECT * FROM EMPLOYEE_1;
-- 101	KIRAN	25	HR	        50000	2020-01-15
-- 102	RAHUL	30	IT	        60000	2019-06-20
-- 103	RIMA	35	FINANCE	    70000	2018-07-10
-- 104	BABITA	40	MARKETING	80000	2021-03-25
-- 105	ARKA	28	IT	        55000	2022-09-05

-- 2. select only the names and salaries of all employees.
select Ename,salary from employee_1;
-- KIRAN	50000
-- RAHUL	60000
-- RIMA	    70000
-- BABITA	80000
-- ARKA	    55000

-- 3. find employees who work in the IT department.
select * from employee_1 where department='IT';
-- 102	RAHUL	30	IT	60000	2019-06-20
-- 105	ARKA	28	IT	55000	2022-09-05
	
-- 4. retrieve employees with the salaries greater than 60000.
select * from employee_1 where salary>'60000';
-- 103	RIMA	35	FINANCE	70000	2018-07-10
-- 104	BABITA	40	MARKETING	80000	2021-03-25
	
-- 5. sort employees by age in ascending order;
select * from employee_1 order by age asc;
-- 101	KIRAN	25	HR	        50000	2020-01-15
-- 105	ARKA	28	IT	        55000	2022-09-05
-- 102	RAHUL	30	IT	        60000	2019-06-20
--  103	RIMA	35	FINANCE	    70000	2018-07-10
-- 104	BABITA	40	MARKETING	80000	2021-03-25
				
-- 6. find the youngest employee.
select * from employee_1 where age=(select min(age) from employee_1); 
-- 101	KIRAN	25	HR	50000	2020-01-15
					
-- 7. count the number of employees in each department.
select count(employee_id) as no_of_emp,department
from employee_1 group by department; 
select department,count(*) as no_of_emps
from employee_1 group by department;
-- 1	HR
-- 2	IT
-- 1	FINANCE
-- 1	MARKETING

-- 8. find the total salary paid by the company.
select sum(salary) as total_salary from employee_1;
-- 315000 --

-- 9. find the average salary off employees in the IT department.alter
select avg(salary) as avg_salary,department from employee_1 group by department having department='IT';
-- 57500.0000	IT--

-- 10. find employees who joined before 2020.
select * from employee_1 where Joining_date<'2020-01-01';  
-- 102	RAHUL	30	IT	60000	2019-06-20
-- 103	RIMA	35	FINANCE	70000	2018-07-10
	
    -- done --
    -- thank you --

