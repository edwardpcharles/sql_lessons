/*

The ORDER BY clause allows you to sort the results of your SQL queries in a specific order. 
This is essential for presenting data in a meaningful way, such as alphabetically, numerically, or by date.

-> column1, column2, ... are the columns you want to sort by.
-> ASC (ascending) sorts data from smallest to largest (A-Z, 0-9, etc.). This is the default if not specified.
-> DESC (descending) sorts data from largest to smallest (Z-A, 9-0, etc.).

The order by is typically the last cause in a simple SQL statement following a having or where statment

*/

--Examples 1. Sorting by a single column ASC:

select product_name, price
from sql_practice.dbo.products
order by price asc;

--Example 2. Sorting by a single column DESC:

select customer_id
, first_name
, last_name
from sql_practice.dbo.customers
order by last_name desc;

--Example 3. Sorting by multiple columns:

select order_id
, order_date
, total_amount
from sql_practice.dbo.orders
order by order_date asc
, total_amount desc;

/*

you can use column numbers instead of column names in the ORDER BY clause. 
For example, ORDER BY 1 ASC, 2 DESC would sort by the first column ascending and the second column descending.
*/

select order_id
, order_date
, total_amount
from sql_practice.dbo.orders
order by 1 asc
, 2 desc;

/*
If you have multiple columns with the same data type, you can use parentheses to group them together to control the sort order. 
For example, ORDER BY (column1, column2) ASC would sort first by column1 and then by column2, both in ascending order.

select order_id
, order_date
, total_amount
from sql_practice.dbo.orders
order by (order_date, total_amount) desc;

WILL NOT WORK IN SQL SERVER

*/

/*
Problem 1 -- You want to generate a list of your customers in alphabetical order. 
How can you retrieve the first_name, last_name, and email of all customers, 
sorted alphabetically by their last_name?"

*/

select first_name
, last_name
, email
from sql_practice.dbo.customers
order by last_name asc;

/*
Problem 2 -- You need to review your latest orders. How can you retrieve the 
order_id, order_date, and total_amount from the Orders table
, sorted with the most recent orders first?"

*/

select order_id
, order_date
, total_amount
from sql_practice.dbo.orders
order by order_date desc;