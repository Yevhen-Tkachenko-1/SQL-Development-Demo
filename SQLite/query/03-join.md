## Join query

#### Tables:

| Employee       |              |     | &vert; |     | Customer       |              |                  |     | &vert; |     | Invoice       |                |           |
|----------------|--------------|-----|--------|-----|----------------|--------------|------------------|-----|--------|-----|---------------|----------------|-----------|
|                |              |     |        |     |                |              |                  |     |        |     |               |                |           |
| **EmployeeId** | **LastName** | ... | &vert; | ... | **EmployeeId** | **LastName** | **SupportRepId** | ... | &vert; | ... | **InvoiceId** | **CustomerId** | **Total** |
|                |              |     |        |     |                |              |                  |     |        |     |               |                |           |
| 1              | Adams        |     | &vert; |     | 1              | Gonçalves    | 3                |     | &vert; |     | 1             | 2              | 1.98      |   
| 2              | Edwards      |     | &vert; |     | 2              | Köhler       | 5                |     | &vert; |     | 2             | 4              | 3.96      |
| 3              | Peacock      |     | &vert; |     | 3              | Tremblay     | 3                |     | &vert; |     | 3             | 8              | 5.94      |
| 4              | Park         |     | &vert; |     | 4              | Hansen       | 4                |     | &vert; |     | 4             | 14             | 8.91      |
| 5              | Johnson      |     | &vert; |     | 5              | Wichterlová  | 4                |     | &vert; |     | 5             | 23             | 13.86     |
| ...            |              |     | &vert; |     | ...            |              |                  |     | &vert; |     | ...           |                |           |

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