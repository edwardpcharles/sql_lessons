/*
Example as to when you need to join data:

	Imagine you have two tables of data. Let's call them "Customers" and "Orders".

	Customers has information about your customers (name, ID, address, etc.).
	Orders has information about orders placed (order ID, customer ID, order date, etc.).
	You want to combine information from both tables to see, for example, which customers have placed orders and what those orders are. That's where joins come in!

Here's the simple breakdown of LEFT and RIGHT joins:

	LEFT JOIN:  Think "left table priority".  It takes ALL the rows from the "left" table (the one mentioned first in your SQL code) and matches them with corresponding rows from the "right" table.  
	If there's no match on the right, it still keeps the left row, but fills in missing values with NULL.

		In our example, Customers LEFT JOIN Orders would show ALL customers, regardless of whether they have an order. Customers with orders would have their order details shown
		, while those without would have NULL for order info.

	RIGHT JOIN: The opposite!  It prioritizes the "right" table, taking ALL its rows and matching them to the left.  If no match on the left, it keeps the right row and uses NULL for missing left-side data.

		Customers RIGHT JOIN Orders would show ALL orders, even if some lack customer info (maybe they're from a guest checkout). Orders with matching customers would have their details, others would have NULL for customer fields.
		
Key takeaways:

	Direction matters: LEFT JOIN and RIGHT JOIN are NOT the same thing!
	NULLs are your clue: They indicate where data is missing from the non-prioritized table.
	Use the right join for the job: Choose based on which table's data you want to keep completely.

Right joins and left joins are the same but with reversed logic. It is much more common to find Left joins then right joins.

*/

--Example 1: LEFT JOIN:  Find all customers and their orders (including customers with no orders)

SELECT c.first_name
, c.last_name
, o.order_id
, o.order_date
FROM sql_practice.dbo.customers c
LEFT JOIN sql_practice.dbo.orders o 
	ON c.customer_id = o.customer_id;

--Example 2: Finding all customers who have not placed a order

SELECT c.*
FROM sql_practice.dbo.customers c
LEFT JOIN sql_practice.dbo.orders o 
	ON c.customer_id = o.customer_id
where o.customer_id is null;

--Example 3: RIGHT JOIN: Find all orders and their customers (including orders who don't have a customer in the table)

SELECT c.first_name
, c.last_name
, o.order_id
, o.order_date
FROM sql_practice.dbo.customers c
Right JOIN sql_practice.dbo.orders o 
	ON c.customer_id = o.customer_id;

-- Example 4: Finding all customes who have placed a order who are not in the customer table
SELECT c.first_name
, c.last_name
, o.order_id
, o.order_date
FROM sql_practice.dbo.customers c
Right JOIN sql_practice.dbo.orders o 
	ON c.customer_id = o.customer_id
where c.customer_id is null;

--Practice Problem #1: Find all products that have not had a order placed against them
select distinct p.product_name
from sql_practice.dbo.products as p
	Left join sql_practice.dbo.orders_item as oi
		on p.product_id = oi.product_id
where oi.product_id is null

--Practice problem #2: Make sure every order in the order table has at least one item in the order item table:
select *
from sql_practice.dbo.orders as o
	Left join sql_practice.dbo.orders_item as oi
	on o.order_id = oi.order_id
where oi.order_id is null

select *
from sql_practice.dbo.orders_item as oi
where oi.order_id = 14447