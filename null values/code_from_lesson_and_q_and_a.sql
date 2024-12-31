--Adding null values into our customer table
insert into sql_practice.dbo.customers(customer_id, first_name, last_name, email, phone)
values (10001, null, null, 'test@icloud.com', '000-000-0000')

--finding all customers with a null first name
select *
from sql_practice.dbo.customers
where first_name is null 

--finding all customers with a not null first name
select *
from sql_practice.dbo.customers
where first_name is not null 

/*
	ISNULL (in T-SQL) or NVL (In other databases)
	Syntax: NVL(expression1, expression2)
	Functionality: If expression1 evaluates to NULL, the NVL function returns expression2. Otherwise, it returns expression1.

	COALESCE
	Syntax: COALESCE(expression1, expression2, ..., expressionN)
	Functionality: Returns the first non-NULL expression in the list.
*/
select isnull(first_name, last_name)
, coalesce(first_name, last_name, 'Bob')
from sql_practice.dbo.customers
where first_name is null 


--Adding null values into our customer table
insert into sql_practice.dbo.customers(customer_id, first_name, last_name, email, phone)
values (10002, 'Bob', null, 'test@icloud.com', '000-000-0000')
, (10003, null, 'find me', 'test@icloud.com', '000-000-0000')

--Problem #1 find any customer in the customer table with the last name of 'Find me' and a null first name
select *
from sql_practice.dbo.customers 
where last_name = 'find me'
and first_name is null

--problem #2 find any customer with a null first name and replace it with the value of UKN
select isnull(first_name, 'UKN')
from sql_practice.dbo.customers
where first_name is null