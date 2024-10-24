## Join query

#### Tables

| Employee       |              |     | * | Customer       |              |                  |
|----------------|--------------|-----|---|----------------|--------------|------------------|
|                |              |     | * |                |              |                  |
| **EmployeeId** | **LastName** | ... | * | **EmployeeId** | **LastName** | **SupportRepId** |
|                |              |     | * |                |              |                  |
| 1              | Adams        |     | * | 1              | Gonçalves    | 3                |
| 2              | Edwards      |     | * | 2              | Köhler       | 5                |
| 3              | Peacock      |     | * | 3              | Tremblay     | 3                |
| 4              | Park         |     | * | 4              | Hansen       | 4                |
| 5              | Johnson      |     | * | 5              | Wichterlová  | 4                |

#### Invoice table:

| InvoiceId | CustomerId | Total | ... |
|-----------|------------|-------|-----|
| 1         | 2          | 1.98  |     |
| 2         | 4          | 3.96  |     |
| 3         | 8          | 5.94  |     |
| 4         | 14         | 8.91  |     |
| 5         | 23         | 13.86 |     |
| ...       | ...        |       |     |

#### Task:

What employees are responsible for the 10 highest individual sales?
Show Employee Lastname, Customer Lastname, Invoice Amount.

#### Solution:
```
SELECT
	e.LastName AS 'Employee Lastname',
	c.LastName AS 'Customer Lastname',
	i.total AS 'Invoice Amount'
FROM
	Invoice AS i
INNER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee AS e
ON
	c.SupportRepId = e.EmployeeId
ORDER BY
	i.total DESC
LIMIT 10
```

#### Output:

| Employee Lastname | Customer Lastname | Invoice Amount |
|-------------------|-------------------|----------------|
| Peacock           | Doeein            | 1000.86        |
| Johnson           | Holý              | 25.86          |
| Park              | Cunningham        | 23.86          |
| Peacock           | Kovács            | 21.86          |
| Peacock           | O'Reilly          | 21.86          |
| Johnson           | Gruber            | 18.86          |
| Johnson           | Stevens           | 	18.86         |
| Johnson           | Rojas             | 17.91          |
| Park              | Wichterlová       | 	16.86         |
| Peacock           | Mercier           | 16.86          |