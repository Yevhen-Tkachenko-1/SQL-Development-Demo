-- Aggregation Functions

/*
Task:
1. Show total purchase amount.
2. Show average purchase amount.
3. Show min purchase amount.
4. Show max purchase amount.
5. Show number of purchases.
6. Round all values up to 1 digit after point.
*/

SELECT
	ROUND(SUM(total), 1) AS 'Total Sum',
	ROUND(AVG(total), 1) AS Average,
	ROUND(MIN(total), 1) AS Minimal,
	ROUND(MAX(total), 1) AS Maximal,
	COUNT(*) AS 'Total Number'
FROM
	Invoice