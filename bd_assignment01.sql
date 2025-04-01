set sql_safe_updates=0;
SHOW databases;
CREATE DATABASE BD_assignment_01;
USE BD_assignment_01;
create table employee
(
	ENO CHAR(3),
	ENAME VARCHAR(15),
	CITY VARCHAR(10)
);
desc employee;

-- ENO	    char(3)	    --			
-- ENAME	varchar(15)	--			
-- CITY	    varchar(10)	--
		
create table emp_company
(
	ENO CHAR(3),
	ENAME VARCHAR(15),
	CNO CHAR (3),
	CNAME VARCHAR(5),
	SALARY DECIMAL(6,2),
	JDATE DATE
);
DESC EMP_COMPANY;

-- ENO	    char(3)		--	
-- ENAME	varchar(15)	--	
-- CNO	    char(3)	    --
-- CNAME	varchar(5)	--	
-- SALARY	decimal(6,2)--	
-- IDATE	date	    --

CREATE TABLE COMPANY
(
	CNO CHAR(3),
	CNAME VARCHAR(15),
	CITY VARCHAR(10)
);
DESC COMPANY;

-- CNO	    char(3)		--
-- CNAME	varchar(15)	--	
-- CITY	    varchar(10)	--
	
CREATE TABLE MANAGER
(
	ENAME VARCHAR(15),
	MNAME VARCHAR(15),
	MNO CHAR(3)
);
DESC MANAGER;

-- ENAME	varchar(15) --
-- MNAME	varchar(15) --
-- MNO	    char(3)     --

CREATE TABLE EMP_SHIFT
(
	ENAME VARCHAR(15),
	SHIFT CHAR(2)
);
DESC EMP_SHIFT;

-- ENAME	varchar(15) --
-- SHIFT	char(2)     --

insert into employee values
('001','ANIL','NAGPUR'),
('002','SHANKAR','MUMBAI'),
('003','JAYA','CHENNAI'),
('004','SUNIL','MUMBAI'),
('005','VIJAY','DELHI'),
('006','PRAKSH','KOLKATA'),
('007','AJAY','CHENNAI');
insert into EMP_COMPANY values
('001','ANIL','AN1','ACC','9000.00','1980/05/01'),
('002','SHANKAR','TM1','TATA','8000.00','1990/07/10'),
('003','JAYA','AC1','CMC','7000.00','1991/06/07'),
('004','SUNIL','CM1','CMC','7000.00','1988/01/01'),
('005','VIJAY','TD1','TATA','8000.00','1988/01/03'),
('006','PRAKASH','AN1','ACC','6000.00','1989/05/27'),
('007','AJAY','AC1','ACC','7000.00','1995/04/30'),
('008','AMOL','TD1','ACC','5000.00','1995/03/17');
insert into COMPANY values
('AC1','ACC','CHENNAI'),
('TM1','TATA','MUMBAI'),
('AN1','ACC','NAGPUR'),
('CC1','CMC','CHENNAI'),
('CM1','CMC','MUMBAI'),
('TD1','TATA','DELHI');
insert into MANAGER values
('ANIL','AJAY','M01'),
('SHANKAR','VIJAY','M02'),
('JAYA',NULL,NULL),
('SUNIL','JAYA','M03'),
('VIJAY',NULL,NULL),
('SHANKAR','PRAKASH','M04'),
('AJAY',NULL,NULL);
insert into EMP_SHIFT values
('ANIL','A'),
('SUNIL','B'),
('VIJAY','B'),
('PRAKASH','C');
-- DO  THW FOLLOWING QUERIES --
-- a) describe each table. 
desc employee;

-- ENO	    char(3)	    --			
-- ENAME	varchar(15)	--			
-- CITY	    varchar(10)	--
		
desc emp_company;

-- ENO	    char(3)		--	
-- ENAME	varchar(15)	--	
-- CNO	    char(3)	    --
-- CNAME	varchar(5)	--	
-- SALARY	decimal(6,2)--	
-- IDATE	date	    --

desc company;

-- CNO	    char(3)		--
-- CNAME	varchar(15)	--	
-- CITY	    varchar(10)	--

desc manager;

-- ENAME	varchar(15) --
-- MNAME	varchar(15) --
-- MNO	    char(3)     --

desc emp_shift;

-- ENAME	varchar(15) --
-- SHIFT	char(2)     --

-- b) retrieve all data from each table
select * from EMPLOYEE;

-- 001	ANIL	NAGPUR   -
-- 002	SHANKAR	MUMBAI  --
-- 003	JAYA	CHENNAI --
-- 004	SUNIL	MUMBAI  --
-- 005	VIJAY	DELHI   --
-- 006	PRAKSH	KOLKATA --
-- 007	AJAY	CHENNAI --
select * from EMP_COMPANY;
-- 001	ANIL	AN1	ACC	 9000.00    1980-05-01 --
-- 002	SHANKAR	TM1	TATA 8000.00	1990-07-10 --
-- 003	JAYA	AC1	CMC	 7000.00	1991-06-07 --
-- 004	SUNIL	CM1	CMC	 7000.00	1988-01-01 --
-- 005	VIJAY	TD1	TATA 8000.00	1988-01-03 --
-- 006	PRAKASH	AN1	ACC	 6000.00	1989-05-27 --
-- 007	AJAY	AC1	ACC	 7000.00	1995-04-30 --
-- 008	AMOL	TD1	ACC	 5000.00	1995-03-17 --
select * from COMPANY;
-- AC1	ACC	    CHENNAI --
-- TM1	TATA	MUMBAI  --
-- AN1	ACC	    NAGPUR  --
-- CC1	CMC	    CHENNAI --
-- CM1	CMC	    MUMBAI  --
-- TD1	TATA	DELHI   --
select * from MANAGER;
-- ANIL 	AJAY	M01 --
-- SHANKAR	VIJAY	M02 --
-- JAYA					--
-- SUNIL	JAYA	M03 --
-- VIJAY				--
-- SHANKAR	PRAKASH	M04 --
-- AJAY				    --
select * from EMP_SHIFT;

-- ANIL 	A --
-- SUNIL	B --
-- PRAKASH	C --
-- c) list the name of companies located in 'MUMBAI'.
select cname from company where city='mumbai';

-- TATA --
-- CMC  --
-- d) list the name of employees living in city 'NAGPUR'. 
select ename from employee where city='nagpur';

-- ANIL --
-- e) list the name of employees wprking with company 'ACC' and receiving a salary greater than RS 5000.00.
select ename from emp_company where cname='acc' and salary>'5000.00';

-- ANIL		--
-- PRAKASH	--
-- AJAY		--
-- F) list the name of employees who are not with company 'ACC'.
select ename from emp_company where not cname='acc';

-- SHANKAR --
-- JAYA	   --
-- SUNIL   --	
-- VIJAY   --
-- g) list the name of employeee who are from company 'ACC' or 'tata'.
select ename from emp_company where cname='acc' or cname='tata';

-- ANIL		--
-- SHANKAR	--
-- VIJAY	--
-- PRAKASH	--
-- AJAY		--
-- AMOL		--
-- h) give manager of employee 'ANIL'.
select mname from manager where ename='anil';

-- AJAY --
-- i) list salaries of employees of 'ACC'.
select salary from emp_company where cname='acc';
-- 9000.00 --
-- 6000.00 --
-- 7000.00 --
-- 5000.00 --
-- j) list cities in which 'TATA' is located.
select city from company where cname='tata';

-- MUMBAI --
-- DELHI  --
-- k) list names of employees having salary greater than RS 8000.00 andd less than 6000.00. 
select ename from emp_company where salary<'6000.00' or salary>'8000.00'; 
select ename from emp_company where salary not between '6000.00' and '8000.00'; 
-- ANIL --
-- AMOL --
-- l) list names of employees having salary less than 8000.00 and greater than 6000.00 and having company 'ACC'.
select ename from emp_company where salary<'8000.00' and salary>'6000.00'and cname='acc';
-- AJAY --

-- m) list name of employees having manager 'VIJAY.'
select ename from manager where mname='vijay';
-- SHANKAR --

-- n) change the city of ENO='007' to 'bengaluru'.
update employee set city='bengaluru' where eno='007';
-- set sql_safe_updates=0; --
select * from employee;
-- 007	AJAY bengaluru --
update employee set city='chennai' where eno='007';
-- 007	AJAY	chennai --

-- o) change the salary of ENO=004 to 7500.00 --
update emp_company set salary='7500.00' where eno='004';
select * from emp_company;
-- 004	SUNIL	CM1	CMC	7500.00	1988-01-01 --
update emp_company set salary='7000.00' where eno='004';
-- 004	SUNIL	CM1	CMC	7000.00	1988-01-01 --

-- p) change the shift of vijay to 'A' --
update emp_shift set shift='A' where ename='vijay';
-- VIJAY	A --
select * from emp_shift;
update emp_shift set shift='B' where ename='vijay';

-- q) create a table named employee_02 from the table employee with all its record --
create table employee_02(select * from employee);
show tables;
-- employee_02 --

-- r) delete all records from employee table --
truncate employee;
select * from employee;
-- delete all records but maintains the table structure. 

-- s) delete the employee name that has no manager --
delete from manager where mname is null;
select * from manager;
-- ANIL	    AJAY	M01 --
-- SHANKAR	VIJAY	M02 --
-- SUNIL	JAYA	M03 --
-- SHANKAR	PRAKASH	M04 --

-- t) addnew column in employee_02 table as following --
alter table employee_02 add column(address varchar(20),phone_no varchar(12));
desc employee_02;
-- ENO	    char(3)	    YES	--		
-- ENAME	varchar(15)	YES	--	 	
-- CITY	    varchar(10)	YES	--		
-- address	varchar(20)	YES	--	
-- phone_no	varchar(12)	YES	--	

-- u) change the size of address column in employee_02 to varchar(30) --
alter table employee modify column address varchar(30);
desc employee_02;
-- address	varchar(20)	YES	--

-- v) delete the table employee --
drop table employee;
show tables;
-- company --
-- emp_company --
-- emp_shift --
-- employee_02 --
-- manager --

-- w) rename the table employee_02 to employee --
rename table employee_02 to employee;
show tables;
-- 	company --
--  emp_company --
--  emp_shift --
-- 	employee --
-- 	manager --

-- WITH THIS ASSIGNMENT_01 ENDS THANK YOU --
-- SUSMIT MAHATO --