/*
Notes: 

SQL works with relational databases, where data is spread across multiple tables
SQL JOINS allow you to combine multiple tables
Multiple types of Joins:
	- inner join
	- right join
	- left join
	- full join
	- union
	- cross join

Inner join retrieves only the rows where a specified condition is met, between two tables

	the "ON" clause you to set criteria. If rows match the criteria they are returned.
	typically in the clause you set two columns equal to each other. 

*/

--Example 1 - Simple join - Showing only customer names who have completed a order:

SELECT c.first_name
, c.last_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
group by c.first_name
, c.last_name;

--Example 2 - Joining Multiple Tables together:

SELECT c.first_name
, c.last_name
, p.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN orders_item oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.first_name
, c.last_name
, p.product_name;

--Example 3  Filtering with WHERE: We can add more filters. For example, to find customers and products that ordered in the past month 

SELECT c.first_name
, c.last_name
, p.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN orders_item oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE o.order_date >= DATEADD(mm, -1, getdate())
group by c.first_name
, c.last_name
, p.product_name


/*
Practice Problems 
Practice Problem #1 - Retrieve all orders with their corresponding customer names. 
	Return the following rows: orderid, firstname, last name
Practice Problem #2 - Find the total quantity of a all products ordered across all orders.
	Return the following rows: product name, qty ordered
*/

--Problem 1 answer
select distinct o.order_id
, c.first_name
, c.last_name
from orders as o
inner join customers as c
	on o.customer_id = c.customer_id;

--problem 2 answer
select p.product_name 
, sum(oi.quantity) as qty_ordered
from orders_item as oi
inner join products as p
	on oi.product_id = p.product_id
group by p.product_name