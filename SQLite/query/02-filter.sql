-- Filtering query

/*
Task:
1. Get Invoice fields: Date, City, Amount, Rate.
2. For Rate field consider next values:
   - If Amount < 1.0 then "Low"
   - If Amount is in bounds [1.0, 5.0) then "Normal"
   - If Amount is in bounds [5.0, 10.0] then "Target"
   - If Amount > 10.0 then "Top"
3. Amount should be in bounds [1.0, 15.0]
4. Exclude Rate value "Normal"
5. Exclude Amount 8.91
6. Cities are London, Berlin, Prague, Paris, Dublin, Lyon, Warsaw, Frankfurt, Vienne, Toronto, Oslo, Boston, New York, Cupertino, Rome, Ottawa
7. Include additional Cities starting with "Rio" or ending with "City"
8. Exclude Invoice completed before 2010-02-15
*/

SELECT
	InvoiceDate AS 'Date',
	BillingCity AS 'City',
	total AS 'Amount',
	CASE
	WHEN total < 1.0 THEN 'Low'
	WHEN total BETWEEN 1.0 AND 4.99 THEN 'Normal'
	WHEN total BETWEEN 5.0 AND 9.99 THEN 'Target'
	ELSE 'Top'
	END AS Rate
FROM
	Invoice
WHERE
	(total BETWEEN 1.0 AND 15.0)
	AND Rate <> 'Normal'
	AND total <> 8.91
	AND (BillingCity IN ('London', 'Berlin', 'Prague', 'Paris', 'Dublin', 'Lyon', 'Warsaw', 'Frankfurt', 'Vienne', 'Toronto', 'Oslo', 'Boston', 'New York', 'Cupertino', 'Rome', 'Ottawa')
		 OR BillingCity LIKE 'Rio%'
		 OR BillingCity LIKE '%City')
	AND DATE(InvoiceDate) >= '2010-02-15'