create database Mysql_project02;
use Mysql_project02;

# CREATING TABLES AND INSERTING DATA INTO TABLE

CREATE TABLE order_details (
  order_id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  customer_id INT NOT NULL,
  product_price DECIMAL(10, 2) NOT NULL,
  product_qty_sold INT NOT NULL,
  PRIMARY KEY (order_id)
);

INSERT INTO order_details (product_id, customer_id, product_price, product_qty_sold)
VALUES 
  (1, 101, 20.05, 2),
  (2, 102, 30.00, 3),
  (3, 103, 10.00, 1),
  (4, 104, 25.70, 2),
  (5, 105, 15.08, 3),
  (1, 106, 20.00, 2),
  (2, 107, 30.00, 3),
  (3, 108, 10.00, 1),
  (4, 109, 25.00, 2),
  (5, 110, 15.00, 3),
  (1, 111, 20.50, 2),
  (2, 112, 30.00, 3),
  (3, 113, 10.40, 1),
  (4, 114, 25.00, 2),
  (5, 115, 15.00, 3),
  (1, 101, 30.00, 1),
  (2, 102, 30.70, 2),
  (3, 103, 10.00, 2),
  (4, 104, 25.00, 3),
  (5, 105, 15.00, 1),
  (1, 106, 20.00, 3),
  (2, 107, 30.60, 2),
  (3, 108, 50.00, 2),
  (4, 109, 25.00, 1),
  (5, 110, 15.00, 3),
  (1, 111, 20.750, 2),
  (2, 112, 30.00, 1),
  (3, 113, 70.80, 3),
  (4, 114, 25.00, 1),
  (5, 115, 15.00, 2);
  
#DISPLAYING ALL THE RECORDS

select* from order_details;


#ANALYSING DATA WITH THE HELP OF QUESTIONS

--Q1)Write a query to produce a count of unique products from the table.

select count(distinct product_id)
from order_details;

--Q2)Write the total Sales revenue of the product having product_id = 4. (where total sales = product_price*product_qty_sold)

select *,product_price*product_qty_sold as total_sales
from order_details;

select *, sum(product_price*product_qty_sold) over() as total_sales
from order_details
where product_id = 4;

--Q3)Write a query to get the highest and lowest price of a product having product_id = 3.

select *,max(product_price) over() as highest_price,min(product_price) over() as lowest_price
from order_details
where product_id = 3;

--Q4)Write a query to get the average ticket size of transactions performed by a customer having customer_id=110.

select *,avg(product_price*product_qty_sold) over() as avg_ticket_size 
from order_details
where customer_id=110;


#CREATING TABLES--

CREATE TABLE social_media_stats (
record_id INT NOT NULL,
date DATE NOT NULL,
social_network VARCHAR(20) NOT NULL,
new_subscribers INT NOT NULL,
PRIMARY KEY (record_id)
);

INSERT INTO social_media_stats (record_id, date, social_network, new_subscribers)
VALUES
(11, '2021-09-01', 'Instagram', 40),
(12, '2021-09-01', 'Facebook', 12),
(13, '2021-09-01', 'LinkedIn', 5),
(14, '2021-09-02', 'Instagram', 67),
(15, '2021-09-02', 'Facebook', 23),
(16, '2021-09-02', 'LinkedIn', 2),
(17, '2021-09-03', 'Instagram', 34),
(18, '2021-09-03', 'Facebook', 25),
(19, '2021-09-03', 'LinkedIn', 10),
(20, '2021-09-04', 'Instagram', 85),
(21, '2021-09-04', 'Facebook', 28),
(22, '2021-09-04', 'LinkedIn', 20);


#ANALYSING DATA WITH THE HELP OF FOLLOWING QUESTIONS

select* from social_media_stats;

--Q1)Write a query to observe the number of running subscribers of ‘LinkedIn’ from the table on ‘2021-09-03’. Choose the correct option.

SELECT *,
    SUM(new_subscribers) OVER (
      PARTITION BY social_network
      ORDER BY date
      ROWS UNBOUNDED PRECEDING) running_total_network
FROM social_media_stats
WHERE social_network='LinkedIn';

CREATE TABLE sales (
  order_id INT NOT NULL,
  order_date DATE NOT NULL,
  customer_name VARCHAR(50) NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (order_id)
);

INSERT INTO sales (order_id, order_date, customer_name, product_name, quantity, price)
VALUES
  (1, '2022-03-01', 'John Doe', 'Product A', 5, 10.50),
  (2, '2022-03-02', 'Jane Doe', 'Product B', 3, 12.00),
  (3, '2022-03-03', 'John Smith', 'Product A', 2, 10.50),
  (4, '2022-03-04', 'Jane Smith', 'Product C', 1, 15.75),
  (5, '2022-03-05', 'John Doe', 'Product B', 4, 12.00),
  (6, '2022-03-06', 'Jane Doe', 'Product A', 2, 10.50),
  (7, '2022-03-07', 'John Smith', 'Product B', 3, 12.00),
  (8, '2022-03-08', 'Jane Smith', 'Product C', 2, 15.75);

select * from sales;

#ANALYSING DATA WITH THE HELP OF FOLLOWING QUESTIONS

--Q1)Which customer bought the same product in consecutive orders and how many times did they buy it?

SELECT customer_name, COUNT(*) AS consecutive_orders
FROM (
  SELECT customer_name, product_name, LAG(product_name) OVER (PARTITION BY customer_name ORDER BY order_date) AS prev_product
  FROM sales
) AS subquery
WHERE product_name = prev_product
GROUP BY customer_name;


--Q2)Which customer purchased the highest-priced product?

select *,first_value(customer_name) over(order by price desc) as high_price
from sales;

--(OR )
SELECT customer_name
FROM (
  SELECT customer_name, LAST_VALUE(price) OVER (
    PARTITION BY customer_name 
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_price
  FROM sales
) AS subquery
WHERE last_price = (
  SELECT MAX(last_price) FROM (
    SELECT LAST_VALUE(price) OVER (
      PARTITION BY customer_name 
      ORDER BY order_date
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_price
    FROM sales
  ) AS subquery2
);


# CASE STATEMENT

CREATE TABLE household (
  member_id INT NOT NULL AUTO_INCREMENT,
  member_name VARCHAR(50) NOT NULL,
  income DECIMAL(10,2) NOT NULL,
  expenses DECIMAL(10,2) NOT NULL,
  birth_date DATE NOT NULL,
  major_expense_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (member_id)
);

INSERT INTO household (member_name, income, expenses, birth_date, major_expense_type)
VALUES
  ('John', 5000.00, 4000.00, '1990-01-01', 'Rent'),
  ('Sarah', 6000.00, 5000.00, '1995-03-15', 'Mortgage'),
  ('David', 8000.00, 7000.00, '1985-07-24', 'Medical'),
  ('Mary', 10000.00, 9000.00, '1978-12-11', 'Medical'),
  ('Tom', 12000.00, 13000.00, '2000-06-30', 'Vacation'),
  ('Samantha', 9000.00, 8000.00, '1993-11-07', 'Vacation'),
  ('Mike', 7500.00, 6000.00, '1989-05-18', 'Rent'),
  ('Lisa', 8500.00, 7500.00, '1992-02-28', 'Rent'),
  ('Richard', 11000.00, 10000.00, '1980-09-23', 'Mortgage'),
  ('Emily', 9500.00, 8000.00, '1998-04-02', 'Travel');


# ANALYSING DATA  WITH HELP OF CASE STATEMENTS



#Consider the "household" table provided. Suppose you want to assign a "segment" label #to each member based on their expenses as follows:

#If expenses are less than 6000, the segment label should be "Low"
#If expenses are between 6000 and 9000 (inclusive), the segment label should be #"Medium"
#If expenses are greater than 9000, the segment label should be "High"

#Write a query to apply these segments to the table and choose all the members which #falls under segment “High” as per the above conditions.

select member_name,case 
        when expenses<6000 then "Low"
        when expenses between 6000 and 9000 then "Medium"
        else "High"
        end as segment
from household;

select* 
from (select member_name,case 
        when expenses<6000 then "Low"
        when expenses between 6000 and 9000 then "Medium"
        else "High"
        end as segment
from household) as t1
where t1.segment = "High";

#The household table contains information about the members of a family, including their income and expenses. 
#You want to retrieve the details of members whose total spending is greater than their income?

select* 
from household
where expenses>income;

SELECT * 
FROM household 
WHERE (CASE WHEN expenses - income < 0 THEN 0 
	   ELSE expenses - income END) > 0;
       
#You want to retrieve the details of members who were born after 1990 and whose major expense type is either "Rent" or "Mortgage."?
SELECT * 
FROM household
where year(birth_date)>1990 and (major_expense_type="Rent" or major_expense_type="Mortgage");

SELECT * FROM household 
WHERE birth_date > '1990-01-01' AND (CASE WHEN major_expense_type = 'Rent' THEN 1 
                                     WHEN major_expense_type = 'Mortgage' THEN 1 ELSE 0 END) = 1;
                                     
#Procedures in SQL

 CREATE TABLE User_Activity(
User_Id int,
Query_Id varchar(16) PRIMARY KEY,
User_query TEXT,
Pages_Showed int,
Page_clicked varchar(32),
Engagement float default 0.01);

INSERT INTO User_Activity
VALUES (1, "Q1345667", "Graph theory and its applications", 10, "P136576", 2);

INSERT INTO User_Activity
VALUES (2, "Q1345668", "Pubs near me", 20, "P14457", 1);

INSERT INTO User_Activity
VALUES (1, "Q1345669", "Graph data structure", 15, "P1278", 0.09);

INSERT INTO User_Activity
VALUES (3, "Q1345670", "Famous cafe in delhi-ncr", 12, "P156889", 7);


CREATE TABLE User_Past_Activity(
User_Id int,
User_query TEXT,
Page_clicked varchar(32),
Engagement float default 0.01);

INSERT INTO User_Past_Activity
VALUES (1, "Restaurants nearby", "P1365", 0.5);

INSERT INTO User_Past_Activity
VALUES (2, "Things to do in Indonesia", "P14567", 3);

INSERT INTO User_Past_Activity
VALUES (2, "Eiffel tower pictures", "P12", 0.67);

INSERT INTO User_Past_Activity
VALUES (3, "Rental properties in delhi", "P156889", 9);

INSERT INTO User_Past_Activity
VALUES (3, "Python programming tutorials", "P134", 2);

INSERT INTO User_Past_Activity
VALUES (3, "best books for data structures", "P146", 6.67);


CREATE TABLE User(
User_Id int PRIMARY KEY,
User_Language varchar(16),
User_Country varchar(256),
User_City varchar(256)
);

INSERT INTO User
VALUES (1, "en-US", "USA", "Seattle");

INSERT INTO User
VALUES (2, "en-UK", "UK", "London");

INSERT INTO User
VALUES (3, "en-IN", "INDIA", "Delhi");       

# The Search engine company wants to run a task to generate the report regarding total engagement
# by each language daily basis.Please create a stored procedure for the same.

select* from User;    
select* from User_Activity;  

select User_Language,sum(Engagement) as total_Engagement
from User as u
join User_Activity as ua
on u.User_Id=ua.User_Id
group by User_Language;  


# PERFORMING PROCEDURE QUERY

DELIMITER &&
create procedure Tot_eng_by_lag()
BEGIN
select User_Language,sum(Engagement) as total_Engagement
from User as u
join User_Activity as ua
on u.User_Id=ua.User_Id
group by User_Language;

END &&
DELIMITER ;


# CALLING PROCEDURE

CALL Tot_eng_by_lag() ;
                   
# The Search engine company wants to run a task to generate the report regarding total engagement
# by TOP N language(s) daily basis.Please create a stored procedure for the same.                   
---stored Procedure with In Parameter----

DELIMITER &&
create procedure Totengbylag(IN n int)
BEGIN
select User_Language,sum(Engagement) as total_Engagement
from User as u
join User_Activity as ua
on u.User_Id=ua.User_Id
group by User_Language
order by sum(Engagement) desc
limit n;

END &&
DELIMITER ;

CALL Totengbylag(2) ;

# The Search engine company wants to run a task to Capture the Queries belonging to
# TOP 1 language based on the total engagement on daily basis.Please create a stored procedure for the same.                   


CREATE TABLE User_Activity(
User_Id int,
Query_Id varchar(16) PRIMARY KEY,
User_query TEXT,
Pages_Showed int,
Page_clicked varchar(32),
Engagement float default 0.01);

INSERT INTO User_Activity
VALUES (1, "Q1345667", "Graph theory and its applications", 10, "P136576", 2);

INSERT INTO User_Activity
VALUES (2, "Q1345668", "Pubs near me", 20, "P14457", 1);

INSERT INTO User_Activity
VALUES (1, "Q1345669", "Graph data structure", 15, "P1278", 0.09);

INSERT INTO User_Activity
VALUES (3, "Q1345670", "Famous cafe in delhi-ncr", 12, "P156889", 7);


CREATE TABLE User_Past_Activity(
User_Id int,
User_query TEXT,
Page_clicked varchar(32),
Engagement float default 0.01);

INSERT INTO User_Past_Activity
VALUES (1, "Restaurants nearby", "P1365", 0.5);

INSERT INTO User_Past_Activity
VALUES (2, "Things to do in Indonesia", "P14567", 3);

INSERT INTO User_Past_Activity
VALUES (2, "Eiffel tower pictures", "P12", 0.67);

INSERT INTO User_Past_Activity
VALUES (3, "Rental properties in delhi", "P156889", 9);

INSERT INTO User_Past_Activity
VALUES (3, "Python programming tutorials", "P134", 2);

INSERT INTO User_Past_Activity
VALUES (3, "best books for data structures", "P146", 6.67);


CREATE TABLE User(
User_Id int PRIMARY KEY,
User_Language varchar(16),
User_Country varchar(256),
User_City varchar(256)
);

INSERT INTO User
VALUES (1, "en-US", "USA", "Seattle");

INSERT INTO User
VALUES (2, "en-UK", "UK", "London");

INSERT INTO User
VALUES (3, "en-IN", "INDIA", "Delhi");

delimiter //
create procedure totalengbylang()
begin
select user_language,
sum(engagement) as total_engagment
from User as u
join User_Activity as ua on u.user_id = ua.user_id
group by user_language;
end //
delimiter ;

call totalengbylang();


DELIMITER $$
CREATE PROCEDURE TotalEngagementByLanguage(IN n INT)
BEGIN
SELECT User_Language, SUM(Engagement) AS Total_Engagement
FROM User AS U
JOIN User_Activity AS UA
ON U.User_Id = UA.User_Id
GROUP BY User_Language
ORDER BY SUM(Engagement) DESC
LIMIT n;
END $$
DELIMITER 

CALL TotalEngagementByLanguage(1);


DELIMITER &&
CREATE PROCEDURE getdetails(OUT n varchar(8))
BEGIN
SELECT User_Language into n
FROM User AS U
JOIN User_Activity AS UA
ON U.User_Id = UA.User_Id
GROUP BY User_Language
ORDER BY SUM(Engagement) DESC
LIMIT 1;
END &&
DELIMITER ;

CALL getdetails(@n);

SELECT UA.*
FROM User_Activity AS UA
JOIN User AS U
ON U.User_Id = UA.User_Id
WHERE U.User_Language = @n;

use mysql_project02;

# The Search engine company wants to run a task to capture the count of current query records 
# Based on the provided User Id(e.g. id=1).Please create a stored procedure for the same.                   

#PERFORMING stored Procedure with InOut Parameter--

select* from User_Activity;

select count(*)
from User_Activity as ua
where User_Id=1
group by User_Id;

DELIMITER &&
CREATE PROCEDURE getcountofuser(INOUT n varchar(32))
BEGIN
select count(*)
into n
from User_Activity as ua
where User_Id=n
group by User_Id;
END &&
DELIMITER ;

#SETTING VALUE TO PROCEDURE AND CALLING PROCEDURE

SET @n=1 ;
call getcountofuser(@n) ;

CALL getdetails(@n);

SELECT UA.*
FROM User_Activity AS UA
JOIN User AS U
ON U.User_Id = UA.User_Id
WHERE U.User_Language = @n;





