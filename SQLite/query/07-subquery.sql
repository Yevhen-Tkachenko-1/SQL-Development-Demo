-- Nested query

/*
Task:
1. For each City in each Country show Average Purchase Amount
2. Show Global Average Amount
3. Consider records only after latest purchase in Cupertino (USA).
4. For City Average Amount show only when this Amount is less than Global Average Amount
*/

SELECT
	BillingCountry AS Country,
	BillingCity AS City,
	ROUND(AVG(total), 2) AS 'City Average',
	(SELECT ROUND(AVG(total), 2) FROM Invoice) AS 'Global Average'
FROM
	Invoice
WHERE
	InvoiceDate > (SELECT MAX(InvoiceDate) FROM Invoice WHERE BillingCountry IS 'USA' AND BillingCity IS 'Cupertino')
GROUP BY
	BillingCountry,
	BillingCity
HAVING
	AVG(total) < (SELECT AVG(total) FROM Invoice)
ORDER BY
	BillingCountry,
	InvoiceDate