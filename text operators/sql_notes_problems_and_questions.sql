/*

Why Text Functions are Useful:

	Changing the way text looks: upper case, lower case, proper case
	Combine text: Adding two strings together
	Extract parts of the text: take a word or part of a string out
	Clean up text: remove trailing or leading spaces

*/

--Example 1: Changing the way text looks:
select first_name
, lower(first_name) as lower_firstname
, upper(first_name) as upper_firstname
from sql_practice.dbo.customers

--Example 2: Combining strings
select CONCAT(first_name, last_name)
, CONCAT(first_name, ' ',last_name)
, first_name + ' ' + last_name
from sql_practice.dbo.customers

--Example 3: extracting text
select Left('dog',2)
, right('dog', 2)
, substring('abcde', 3, 3)

--Example 4: removing whitespace
select Ltrim(' Edward')
, Rtrim('Charles ')
, trim(' Edward Charles , ')

--Extra functions
select LEN('adfasdf')
, REPLACE('adfasdr','a', '')
, CHARINDEX('a','adfasdf',1)

--Problem #1: Clean the text ' This  is a product description.'
--double spaces should be replaced with a single space
--no leading spaces should exist

select Ltrim(replace(' This  is a product description.', '  ', ' '))

--Problem #2: Break the name edward_charles up into two individual Columns
--first column named "first name"
--second column named "Last name"
--split based on location of underscore

select SUBSTRING('edward_charles', 1, CHARINDEX('_', 'edward_charles',1)-1) as first_name
, SUBSTRING('edward_charles',CHARINDEX('_', 'edward_charles',1)+1, LEN('edward_charles')) as last_name
