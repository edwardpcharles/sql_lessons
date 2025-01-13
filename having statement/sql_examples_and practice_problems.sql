/*

The HAVING clause is used to filter the results of a query after they have been grouped by certain columns. 
Unlike the WHERE clause, which filters rows before grouping, HAVING filters groups based on aggregated values.

What you absolutely need to know: 
-> The HAVING clause must always follow the GROUP BY clause.
-> The HAVING condition can only use columns that are either in the GROUP BY clause or are part of an aggregate function.
-> Aggregate functions used in HAVING: COUNT, SUM, AVG, MIN, MAX, etc.

*/

--Example 1. We group by all columns to avoid any unintended aggregation.

select order_id
, customer_id
, order_date
, total_amount
from sql_practice.dbo.orders
group by order_id
, customer_id
, order_date
, total_amount
having total_amount > 500;

--Example 2. We filter by an aggregate function.

select order_date
, avg(total_amount) AS average_amount
from sql_practice.dbo.orders
group by order_date
having avg(total_amount) > 600;

/*
Problem 1 -- You're analyzing your sales data to identify days with unusually high order volumes. 
How can you find the order_dates where the total total_amount of orders exceeds $5000?

*/

select order_date
, SUM(total_amount) AS daily_total
FROM sql_practice.dbo.orders
GROUP BY order_date
HAVING SUM(total_amount) > 5000;

/*
Problem 2 -- You want to identify your best-selling products. 
How can you find the product_id and the total quantity sold for products 
that have been ordered more than 20 times in total?"

*/

select product_id
, SUM(quantity) AS total_quantity
from sql_practice.dbo.orders_item
group by product_id
having SUM(quantity) > 20;