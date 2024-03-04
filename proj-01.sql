create database Mysql_project02;
use Mysql_project02;

#CREATING TABLES AND INSERTING DATA INTO IT

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
  
#--DISPLAYING TABLE--  
  
select* from order_details;

#--ANALYSING DATA USING FOLLOWING INSTRUCTION :-

--Q1)Write a query to produce a count of unique products from the table.

select count(distinct product_id) 
from order_details;

--Q2)Write the total Sales revenue of the product having product_id = 4. (where total sales = product_price*product_qty_sold)

select *,product_price*product_qty_sold as total_sales
from order_details;

select sum(product_price*product_qty_sold) as total_sales
from order_details
where product_id = 4;

--Q3)Write a query to get the highest and lowest price of a product having product_id = 3.

select max(product_price) as highest_price,min(product_price) as lowest_price
from order_details
where product_id = 3;

--Q4)Write a query to get the average ticket size of transactions performed by a customer having customer_id=110.

select avg(product_price*product_qty_sold) as avg_ticket_size 
from order_details
where customer_id=110;










