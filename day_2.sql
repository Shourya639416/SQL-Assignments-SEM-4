show databases;
create database kipilearn_day_2;
use kipilearn_day_2;
set sql_safe_updates=0;

create table Products 
(	
	Product_ID int primary key,
	Product_name varchar(20) not null,
	Category varchar(20) not null,
	Price decimal(6),
    Stock int
);

desc Products;
-- Product_ID	  int	        NO	PRI		
-- Product_name	  varchar(20)	NO			
-- Category	      varchar(20)	NO			
-- Price	      decimal(6,0)	YES			
-- Stock	      int	        YES		
	
insert into Products values
('1','Laptop','Electronics','800','10'),
('2','Phone','Electronics','500','25'),
('3','Chair','Furniture','100','50'),
('4','desk','Furniture','200','30'),
('5','TV','Electronics','1000','5');

select * from Products;
-- 1	Laptop	Electronics	800	    10
-- 2	Phone	Electronics	500	    25
-- 3	Chair	Furniture	100	    50
-- 4	desk	Furniture	200 	30
-- 5	TV	    Electronics	1000	5
				
create table Orders
(
	Order_ID int,
	Product_ID int,
	Quantity int,
	Order_date date,
    primary key(Order_ID,Product_ID),
    foreign key(Product_ID) references Products(Product_ID)
);

desc Orders;
-- Order_ID	    int	    NO	PRI		
-- Product_ID	int 	NO	PRI		
-- Quantity	    int  	YES			
-- Order_date	date	YES			
		
insert into Orders values
('101','1','2','2024/02/10'),
('102','2','1','2024/02/11'),
('103','3','5','2024/02/12'),
('104','1','1','2024/02/12'),
('105','5','1','2024/02/13');

select * from Orders;
-- 101	1	2	2024-02-10
-- 102	2	1	2024-02-11
-- 103	3	5	2024-02-12
-- 104	1	1	2024-02-12
-- 105	5	1	2024-02-13

--  1.retrieve all products with price greater than 500 --
select * from Products where price>500;
-- 1	Laptop	Electronics	800	    10
-- 5	TV	    Electronics	1000	5
				
--  2.find total number of orders placed --
select count(*) as total_orders from Orders;
-- total_orders
-- 5

--  3.retrieve the products names and prices of all electronics items --
select Product_name,Price from Products where category="electronics";
-- Laptop	800
-- Phone	500
-- TV	   1000

--  4.find the most expensive products --
select * from Products where price=(select max(price) from Products);
-- 5	TV	Electronics	1000	5
				
--  5.find the total revenue generated from all the orders --
select sum(P.Price * O.Quantity) as total_revenue 
from Products P join Orders O on P.Product_ID=O.Product_ID;
-- total_revenue
-- 4400

--  6.get the number of orders for each product --
select P.Product_name,count(O.Order_ID) as order_count 
from Products P join Orders O on P.Product_ID=O.Product_ID 
group by Product_name;
-- Product_name   Order_count
-- Laptop	2
-- Phone	1
-- Chair	1
-- TV   	1

--  7.retrieve the latest order placed --
select * from Orders order by Order_date desc limit 1;
-- 105	5	1	2024-02-13
			
--  8.find the products that has lowest stock --
select * from Products where stock=(select min(stock) from Products);
-- 5	TV	Electronics	1000	5

--  9.get the total quantity of products sold --
select sum(Quantity) as total_orders from Orders;
-- total_orders
-- 10

-- 10.find the number of distinct product categories --
select distinct category from Products;
-- Electronics
-- Furniture
select count(distinct category) from Products;
-- 2




-- THANNK YOU --
-- SUSMIT MAHATO -- 



