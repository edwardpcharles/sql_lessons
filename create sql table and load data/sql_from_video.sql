--creating the sql_practice database
create database sql_practice;

--creating the orders table
create table orders (
	order_id bigint primary key,
	customer_id bigint,
	order_date date,
	total_amount decimal(10,2)
);

--inserting data into orders table
insert into sql_practice.dbo.orders (order_id, customer_id, order_date, total_amount)
values (1, 6133, '2024-01-01', 0.20);

--deleting all data from the orders table
delete from sql_practice.dbo.orders;

--bulk inserting data into the orders table
bulk insert sql_practice.dbo.orders
from 'c:\file_path'
with (
	format = 'CSV',
	FieldQuote = '"',
	rowterminator = '\n',
	firstrow = 2
);
