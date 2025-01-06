--This function retrieves the current system date and time.
select getdate() 

--Extracts a specific part of a date
select DATEPART(year, GETDATE()) AS current_year;
select DATEPART(month, GETDATE()) AS current_month;
select DATEPART(day, GETDATE()) AS current_day;

--Adding or Subtracting interval from dates
select DATEADD(day, 10, GETDATE()) AS ten_days_from_now;
select DATEADD(month, -3, GETDATE()) AS three_months_ago;

-- you can also use the plus and minus icon:
select GETDATE() - 3 three_days_ago
select getDate() + 3 three_days_from_now

--subtracting two different dates:
select DATEDIFF(day, '2025-01-01', GETDATE()) AS days_since_start_of_year;
select DATEDIFF(year, '1990-01-01', GETDATE()) AS age_in_years;


--getting end of month
select EOMONTH(GETDATE()) AS last_day_of_current_month;
select EOMONTH(GETDATE(), -1) AS last_day_of_prior_month;

/*
Removes the time portion from a datetime value in T-SQL.

DATEDIFF(dd, 0, GETDATE()) calculates the number of days between
the base date (0, which represents 1900-01-01) and the current date.

DATEADD(dd, ..., 0) adds that number of days back to the base date,
effectively giving you the current date with the time set to
midnight (00:00:00.000).

DATETRUNC() in other systems

You can also cast a date time as a date

*/
select DATEADD(year, DATEDIFF(year, 0, GETDATE()), 0) AS trunc_year;
select DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0) AS trunc_month;
select DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0) AS trunc_day;


--problem 1: Indentify the date 30 days ago
select DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0) - 30

--Problem 2: Identify how many days have passed since the start of the year
select DATEADD(year, DATEDIFF(year, 0, GETDATE()), 0) as current_year
, DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0) as current_day
, DATEDIFF(
	day   
	, DATEADD(year, DATEDIFF(year, 0, GETDATE()), 0) 
	, DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0)
) as dif_in_days

