show databases;
create database bd_assignment_02;
use bd_assignment_02;
set sql_safe_updates=0;

-- 1) Create the following tables:
	
          --   a) Table name: EMP --
-- Column name	Data type	Size	Constraints
-- Eno	        Char	    3	    Primary key and first character must be “E”
-- Ename	    Varchar	    10	    Not Null
-- City	        Varchar  	10	    Cities allowed “Chennai”, “Mumbai”, “Delhi”, “Kolkata”
-- Salary	    Decimal  	6	
-- Dno	        Decimal 	3	    Foreign key reference DEPT table
-- Join_date	Date		

create table EMP
(
	Eno char(3)
	  primary key check(ENO like'E%'),
	Ename varchar(10)
	  not null,
	City varchar(10)
	  check(city in('Chennai','Mumbai','Delhi','Kolkata')),
	salary decimal(6),
	Dno decimal(3), 
	  foreign key(Dno) references DEPT(Dno),
	Join_date date
);
desc EMP;
-- Eno  	  char(3)	    NO	 PRI		
-- Ename	  varchar(10) 	NO			
-- City	      varchar(10)	YES			
-- salary	  decimal(6,0)	YES			
-- Dno	      decimal(3,0)	YES	 MUL		
-- Join_date  date	        YES			

  --          b) Table name: DEPT --
-- Column name	Data type	Size	Constraints
-- Dno      	Decimal 	3	    Primary key
-- Dname	    Varchar 	15	

create table DEPT
(
	Dno decimal(3)
	  primary key,
	Dname varchar(15)
);
desc DEPT;
-- Dno	    decimal(3,0)	NO	 PRI		
-- Dname	varchar(15)	    YES			

-- Table name: PROJECT --
-- Column name	Data type	Size	Constraints
-- Pno	        Char	    3   	Primary key, first character must be “P”
-- Eno      	Char	    3       Primary key and Foreign key references EMP

create table PROJECT
(
	Pno char(3)
	  check(Pno like'P%'),
	Eno char(3),
	  primary key(Pno,Eno),
	  foreign key(Eno) references EMP(Eno)
);
desc PROJECT;
-- Pno	char(3)	NO	PRI		
-- Eno	char(3)	NO	PRI		

-- 2) Insert the following data into the corresponding table:
	-- Table: EMP --
-- Eno	Ename	City	Salary	Dno	Join_date
-- E01	Ashim	Kolkata	10000	1	01-Jun-02
-- E02	Kamal	Mumbai	18000	2	01-Jun-02
-- E03	Tamal	Chennai	7000	1	01-Jun-02
-- E04	Asha	Kolkata	8000	2	01-Jul-02
-- E05	Timir	Delhi	7000	1	01-Aug-02
insert into EMP values
('E01','Ashim','Kolkata','10000','1','2002/06/01'),
('E02','Kamal','Mumbai','18000','2','2002/06/01'),
('E03','Tamal','chennai','7000','1','2002/06/01'),
('E04','Asha','Kolkata','8000','2','2002/07/01'),
('E05','Timir','Delhi','7000','1','2002/08/02');
select * from EMP;
-- E01	Ashim	Kolkata	10000	1	2002-06-01
-- E02	Kamal	Mumbai	18000	2	2002-06-01
-- E03	Tamal	chennai	7000	1	2002-06-01
-- E04	Asha	Kolkata	8000	2	2002-07-01
-- E05	Timir	Delhi	7000	1	2002-08-02

--  Table: DEPT --
-- Dno	Dname
-- 1	Research
-- 2	Finance
insert into DEPT values
('1','Research'),
('2','Finance');
select * from DEPT;
-- 1	Research
-- 2	Finance

-- Table: PROJECT --
-- Pno	Eno
-- P01	E01
-- P02	E03
-- P01	E05
-- P02	E01
insert into PROJECT values
('P01','E01'),
('P02','E03'),
('P01','E05'),
('P02','E01');
select * from PROJECT;
-- P01	E01
-- P02	E01
-- P02	E03
-- P01	E05

-- *)Do the following Queries:
-- a.Display all employees having “a” as the second letter in their names.
select Ename from EMP where ename like '_a%';
-- Kamal
-- Tamal

-- b.	Display employee names for those who joined in the month of July.
select ename from EMP where Join_date like '%-07-%';
-- Asha

-- c.	Display names of all employees in the alphabetic order.
select ename from EMP order by ename asc;
-- Asha
-- Ashim
-- Kamal
-- Tamal
-- Timir

-- d.	Display the list of all employees who stay in a city whose second letter is “o”.
select ename from EMP where city like '_o%';
-- Ashim
-- Asha

-- e.	Find out the list of all clients who stay in “Mumbai” or “Delhi”.
select ename from EMP where city='Mumbai' or city='Delhi';
-- Kamal
-- Timir

-- f.	Find the average salary of all employees.
select avg(salary) from EMP;
-- 10000.0000

-- g.	Print the list of employees name in sorted order on the salary amount (descending).
select Ename from EMP order by salary desc;
-- Kamal
-- Ashim
-- Asha
-- Tamal
-- Timir

-- h.	List the Eno, City and employee names that are not in the city of “Kolkata”.
select Eno,City,Ename from EMP where not city='Kolkata';
-- E02	Mumbai	Kamal
-- E03	chennai	Tamal
-- E05	Delhi	Timir
		
-- i.	Print the list of employees whose salary is grater than 10000.
select Ename from EMP where salary>'10000';
-- 	Kamal

-- j.	List only the names of all other employees who get the same basic pay as that of employee “Tamal”.
select ename from EMP where salary=(select salary from EMP where ename='Tamal') and Ename<>'Tamal';
-- Timir

-- k.	List all the employee names whose salary is greater than 7000 and lesser than 18000.
select Ename from EMP where salary>'7000' and salary<'18000';
-- Ashim
-- Asha
select Ename from EMP where salary between '7000' and '18000';
-- shows the salary of 7000 and 18000 also to exclude them we use < or > .
-- Ashim
-- Kamal
-- Tamal
-- Asha
-- Timir

-- l.	Display the name of employees who belong to either “Chennai” or “Mumbai” or “Delhi”.
select Ename from EMP where city in ('Chennai','Mumbai','Delhi');
-- Kamal
-- Tamal
-- Timir

-- m.	Retrieve all information about employee where the “Ename” is 4 characters long and the first two characters are “As”.
select Ename from EMP where Ename like 'As__';
-- Asha

-- n.	Retrieve the project number and name of the employees.
select * from EMP E,PROJECT P;-- [simple cartesian products]
-- E01	Ashim	Kolkata	10000	1	2002-06-01	P01	E05
-- E01	Ashim	Kolkata	10000	1	2002-06-01	P02	E03
-- E01	Ashim	Kolkata	10000	1	2002-06-01	P02	E01
-- E01	Ashim	Kolkata	10000	1	2002-06-01	P01	E01
-- E02	Kamal	Mumbai	18000	2	2002-06-01	P01	E05
-- E02	Kamal	Mumbai	18000	2	2002-06-01	P02	E03
-- E02	Kamal	Mumbai	18000	2	2002-06-01	P02	E01
-- E02	Kamal	Mumbai	18000	2	2002-06-01	P01	E01
-- E03	Tamal	chennai	7000	1	2002-06-01	P01	E05
-- E03	Tamal	chennai	7000	1	2002-06-01	P02	E03
-- E03	Tamal	chennai	7000	1	2002-06-01	P02	E01
-- E03	Tamal	chennai	7000	1	2002-06-01	P01	E01
-- E04	Asha	Kolkata	8000	2	2002-07-01	P01	E05
-- E04	Asha	Kolkata	8000	2	2002-07-01	P02	E03
-- E04	Asha	Kolkata	8000	2	2002-07-01	P02	E01
-- E04	Asha	Kolkata	8000	2	2002-07-01	P01	E01
-- E05	Timir	Delhi	7000	1	2002-08-02	P01	E05
-- E05	Timir	Delhi	7000	1	2002-08-02	P02	E03
-- E05	Timir	Delhi	7000	1	2002-08-02	P02	E01
-- E05	Timir	Delhi	7000	1	2002-08-02	P01	E01
select * from EMP E,PROJECT P where E.Eno=P.Eno;
select * from EMP E join PROJECT P on E.Eno=P.Eno;
-- [ natural join with a equal condition eliminates ecess datas]
-- E01	Ashim	Kolkata	10000	1	2002-06-01	P01	E01
-- E01	Ashim	Kolkata	10000	1	2002-06-01	P02	E01
-- E03	Tamal	chennai	7000	1	2002-06-01	P02	E03
-- E05	Timir	Delhi	7000	1	2002-08-02	P01	E05
select Pno,Ename from EMP E,PROJECT P where E.Eno=P.Eno;
-- ANS --
-- P01	Ashim
-- P02	Ashim
-- P02	Tamal
-- P01	Timir

-- o.	Display the number of employees in each department.
select * from EMP E,DEPT D where E.Dno=D.Dno;
select * from EMP E join DEPT D on E.Dno=D.Dno;
-- E01	Ashim	Kolkata	10000	1	2002-06-01	1	Research
-- E02	Kamal	Mumbai	18000	2	2002-06-01	2	Finance
-- E03	Tamal	chennai	7000	1	2002-06-01	1	Research
-- E04	Asha	Kolkata	8000	2	2002-07-01	2	Finance
-- E05	Timir	Delhi	7000	1	2002-08-02	1	Research
select D.Dno,count(E.Eno) as no_of_emps from EMP E join DEPT D on E.Dno=D.Dno group by D.Dno;
-- 	Dno	no_of_emps
-- 	2	2
-- 	1	3

-- p.	Display list of all employees in department no. 2.
select D.Dno,count(E.Eno) as no_of_emps from EMP E join DEPT D on E.Dno=D.Dno group by D.Dno having count(E.Eno)='2';
-- Dno  no_of_emps
-- 2	2

-- q.	Find all departments that have more than 3 employees.
select D.Dno,count(E.Eno) as no_of_emps from EMP E join DEPT D on E.Dno=D.Dno group by D.Dno having count(E.Eno)='3';
-- Dno  no_of_emps
-- 1	3

-- r.	Display the structure of the table EMP.
desc EMP;
-- Eno	      char(3)   	NO	  PRI		
-- Ename	  varchar(10)	NO			
-- City	      varchar(10)	YES			
-- salary     decimal(6,0)	YES			
-- Dno	      decimal(3,0)	YES   MUL		
-- Join_date  date	        YES			

-- s.	Find the difference between highest and lowest salary.
select MAX(salary)-min(salary) as salary_difference from EMP;
-- salary_difference
-- 11000


-- thank you so much this is my 2nd assigment in sql --
-- SUSMIT MAHATO --



