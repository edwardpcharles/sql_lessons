/*
Understanding UNION vs UNION ALL

- **UNION**: Combines result sets from two or more SELECT statements. It removes duplicate rows.
- **UNION ALL**: Combines result sets from two or more SELECT statements without removing duplicates.

*/

-- Example 1: combining dogs with union

SELECT 'dog'
UNION
SELECT 'dog';

--Example 2: combining dogs aliases

SELECT 'dog' as buster
UNION
SELECT 'dog';

SELECT 'dog' 
UNION
SELECT 'dog' as buster;

--Example 3: combining dogs with with union all

SELECT 'dog'
UNION All
SELECT 'dog';

-- Practice Problems

/*Problem 1: List All Customer Names and Their Total Orders
Write a SQL query that has a row for every customer and each order amount
and then a row for every customer and the total amount ordered accross all orders, with a column that indicates if the 
row represents a single order or the total amount
*/

SELECT c.first_name
, c.last_name
, o.total_amount
, 'single order' as total_amount 
FROM sql_practice.dbo.Customers c
JOIN sql_practice.dbo.Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.first_name
, c.last_name
, SUM(o.total_amount)
, 'total amount' 
FROM sql_practice.dbo.Customers c
JOIN sql_practice.dbo.Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id,
c.first_name
, c.last_name;

/*Problem 2: List All Products and Their Unit Prices from Orders
Write a query that lists all product names along with the unit prices as recorded in each `Order_Items` record.
Along with a row for each Product with a $0.00 unit price
*/

SELECT p.product_name
, oi.unit_price
FROM sql_practice.dbo.Products p
JOIN sql_practice.dbo.Orders_Item oi 
	ON p.product_id = oi.product_id
UNION ALL
SELECT p.product_name
, 0 as unit_price
FROM sql_practice.dbo.Products p;

