
--bulk inserting data into the orders table
bulk insert sql_practice.dbo.orders
from 'D:\Youtube Channel\Uploaded Videos\Learn SQL\data_files\12_25_2024 organizing a database\Orders.csv'
with (
	format = 'CSV',
	FieldQuote = '"',
	rowterminator = '\n',
	firstrow = 2
);

--bulk inserting data into the orders item table
bulk insert sql_practice.dbo.orders_item
from 'D:\Youtube Channel\Uploaded Videos\Learn SQL\data_files\12_25_2024 organizing a database\OrderItems.csv'
with (
	format = 'CSV',
	FieldQuote = '"',
	rowterminator = '\n',
	firstrow = 2
);

--bulk inserting data into the customers table
bulk insert sql_practice.dbo.customers
from 'D:\Youtube Channel\Uploaded Videos\Learn SQL\data_files\12_25_2024 organizing a database\Customers.csv'
with (
	format = 'CSV',
	FieldQuote = '"',
	rowterminator = '\n',
	firstrow = 2
);

--bulk inserting data into the products table
bulk insert sql_practice.dbo.products
from 'D:\Youtube Channel\Uploaded Videos\Learn SQL\data_files\12_25_2024 organizing a database\Products.csv'
with (
	format = 'CSV',
	FieldQuote = '"',
	rowterminator = '\n',
	firstrow = 2
);