 
--Creating table
 create table sql_practice.dbo.candy (
	candy_type varchar(255),
	color varchar(255),
	qty int
)

--bulk loading date
bulk insert sql_practice.dbo.candy
from 'D:\Youtube Channel\Uploaded Videos\Learn SQL\2025_01_10 group by and aggregate functions\candy_data.csv'
with (
	format = 'CSV',
	FieldQuote = '"',
	rowterminator = '\n',
	firstrow = 2
);

/* 

COUNT()

Purpose: Counts the number of rows that match a specific condition.
Example: COUNT(*) counts all rows in a table, while COUNT(column_name) counts the non-null values in a specific column.

Types of candy by color:

*/
	select color
	, count(candy_type)
	from sql_practice.dbo.candy
	group by color


/*

SUM()

Purpose: Calculates the sum of a numeric column.
Example: SUM(quantity) would calculate the total quantity of all items in an orders table.

Total pieces of candy by type:

*/

	select candy_type
	, sum(qty)
	from sql_practice.dbo.candy
	group by candy_type


/*

AVG()

Purpose: Calculates the average value of a numeric column.
Example: AVG(grade) would calculate the average grade of all students in a class.

Average pieces of candy by type:

*/

	select candy_type
	, avg(qty)
	from sql_practice.dbo.candy
	group by candy_type

/*

MAX()

Purpose: Returns the maximum value in a column.
Example: MAX(salary) would find the highest salary in an employee table.

Highest number of pieceses of candy across all type / color combos

*/

	select max(qty)
	from sql_practice.dbo.candy

/*

MIN()

Purpose: Returns the minimum value in a column.
Example: MIN(age) would find the youngest person in a customer database.

Lowest number of pieces of candy across all type / color combos

*/

	select min(qty)
	from sql_practice.dbo.candy

--practice problem 1 - sum of total amount across all orders name the column "total value"
select sum(total_amount) as 'Total Value'
from sql_practice.dbo.orders as a

--practice problem 2 - group by the month of the order and sum of the total sales by month name the column "total value"
select month(order_date) as month_val
, sum(total_amount) as 'Total Value'
from sql_practice.dbo.orders
group by month(order_date) 
