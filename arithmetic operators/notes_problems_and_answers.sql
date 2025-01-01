--selecting data from the orders item table
select *
from sql_practice.dbo.orders_item

/*
Arithmetic Operators

+ (Addition): Adds two numbers together.
- (Subtraction): Subtracts one number from another.
* (Multiplication): Multiplies two numbers.   
/ (Division): Divides one number by another.
% (Modulo): Returns the remainder of a division operation.   

*/

--initial query
select quantity + unit_price as quantity_plus_unit_price
, (quantity - unit_price) / quantity  
, quantity * unit_price 
, quantity / unit_price 
, quantity % unit_price 
, unit_price % quantity
from sql_practice.dbo.orders_item;

--practice problem #1 Make a SQL Query against unit price in the orders item table multiplied by .1 called ten_per_off
select order_id
, order_item_id
, unit_price * .1 as ten_per_off
from sql_practice.dbo.orders_item

--practice problem #2 write a SQL query that calculates the order item total
select *
, quantity * unit_price as order_line_total
from sql_practice.dbo.orders_item