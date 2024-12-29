select distinct order_date
from sql_practice.dbo.orders

--Practice Problem 1: write a query to return only unique customer emails  
select distinct email
from sql_practice.dbo.customers

--Practice Problem 2: write a query to return only 10 unique products
select distinct top 10 product_name
from sql_practice.dbo.products