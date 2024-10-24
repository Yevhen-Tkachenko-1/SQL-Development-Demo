-- Modification Functions

/*
Task:
1. Show Customer`s Info including First Name, Last Name, Address, City in one column.
2. Show number of non-empty signs in Customer`s Postcode
3. Show country code for Customer`s phone number (first 4 digits skipping '+', '(', ')' signs).
4. Show Customer`s company in Upper case. For missing records show 'Unknown'.
5. Show Employee`s birthday (year, months, day without time).
6. Show Employee`s age based on birthday.
7. Sort result by Customer`s Info
*/

SELECT
	c.FirstName || ' ' || c.LastName || ' ' || c.Address || ' ' || c.City AS 'Customer''s short info',
	c.PostalCode AS 'Postal Code Size',
	LENGTH(REPLACE(c.PostalCode, ' ', '')) AS 'Postal Code Size',
	SUBSTR(REPLACE(REPLACE(REPLACE(c.Phone, ')',''), '(',''), ' ', ''), 2, 4) AS 'Phone Country Code',
	IFNULL(UPPER(c.Company), 'Unknown') AS 'Job',
	STRFTIME('%Y-%m-%d', Birthdate) AS 'Employee''s Birthday',
	STRFTIME('%Y-%m-%d', 'now') - STRFTIME('%Y-%m-%d', Birthdate) AS 'Employee''s Age'
FROM
	Customer AS c
INNER JOIN
	Employee AS e
ON
	c.SupportRepId = e.EmployeeId
ORDER BY
	1