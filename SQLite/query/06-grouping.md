-- Grouping query

There are tables:

/*
Task:
1. For each City in each Country get Average amount and Number of purchases
2. Show when Average Amount > 10.0
3. Show when City that contains 's' letter
4. Order by Country and City
5. Limit to 20
*/

```
SELECT
	BillingCountry AS Country,
	BillingCity AS City,
	ROUND(AVG(total), 2) AS 'Average Amount',
	COUNT(total) AS 'Total Number'
FROM
	Invoice
WHERE
	BillingCity LIKE '%s%'
GROUP BY
	BillingCountry, BillingCity
HAVING
	AVG(total) > 5.0
ORDER BY
	BillingCountry, BillingCity
LIMIT 20
```