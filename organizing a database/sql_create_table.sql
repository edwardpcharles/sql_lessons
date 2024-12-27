drop table orders;
--creating the orders table
create table sql_practice.dbo.orders (
	order_id bigint primary key,
	customer_id bigint,
	order_date date,
	total_amount decimal(10,2)
);

--creating the orders item table
create table sql_practice.dbo.orders_item (
	order_item_id bigint primary key,
	order_id bigint,
	product_id bigint,
	quantity int,
	unit_price decimal(10,2)
);

--creating the customers table
create table sql_practice.dbo.customers (
	customer_id bigint primary key,
	first_name varchar(255),
	last_name varchar(255),
	email varchar(255),
	phone varchar(255)
);


--creating the products table
create table sql_practice.dbo.products (
	product_id bigint primary key,
	product_name varchar(255),
	category varchar(255),
	price decimal(10,2)
);
