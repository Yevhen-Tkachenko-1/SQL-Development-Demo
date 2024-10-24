-- Simple read query

/*
Task:
1. Get Customers by showing first name, last name, email address.
2. Choose only those who work in some Company.
3. Sort by first name first, then by last name in reverse alphabetical order.
4. Limit result up to 10 records.
*/

SELECT
	FirstName AS [Customer First Name],
	LastName AS 'Customer Last Name',
	Email AS Email
FROM
	Customer
WHERE
	Company IS NOT NULL
ORDER BY
	FirstName,
	LastName DESC
LIMIT 10