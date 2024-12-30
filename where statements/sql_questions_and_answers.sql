--problem #1 find all customers with a c in their first name
select *
from sql_practice.dbo.customers
where first_name like '%c%'

/*problem #2 find all products priced less then 100 that contain 
either the letter a or h in their product name*/
select *
from sql_practice.dbo.products
where price < 100
and (product_name like '%a%' or product_name like '%h%')