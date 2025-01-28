/*
Imagine you're trying to combine two datasets, but you want to keep all the information from both, even if there are no matches between them. 
This is where the FULL OUTER JOIN comes in. It's like the most inclusive party in SQL – everyone's invited!

More formally, a FULL OUTER JOIN returns all rows from both tables involved in the join. 
If a row has a match in the other table, the corresponding columns are filled with data from that match. 
But here's the key: if there's no match, the columns from the other table are filled with NULL values.

*/

--Example 1: Full Outer Join orders and orders items

SELECT o.order_id
, oi.order_item_id
FROM sql_practice.dbo.orders o
FULL JOIN sql_practice.dbo.orders_item oi
	ON o.order_id = oi.order_id;


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