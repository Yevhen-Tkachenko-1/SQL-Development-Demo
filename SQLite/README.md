# SQL Querying using SQLite Database
_Learn and play with SQLite Database: make query for data reading, creating, updating, deleting_

Implemented based on LinkedIn learning course:
[SQL Essential Training](https://www.linkedin.com/learning/sql-essential-training-20685933)

Content:

* [SQL Overview](#sql-overview)
  * [Simple Select](#simple-select)
  * [Filter Statements](#filter-statements)
  * [Simple Join](#simple-join)
  * [Modification Functions](#modification-functions)
  * [Aggregation Functions](#aggregation-functions)
  * [Grouping](#grouping)
  * [Nested](#nested)
  * [Add row](#add-row)
  * [Update row](#update-row)
  * [Delete row](#delete-row)
* [SQLite Execute](#sqlite-execute)
  * [Join Example](#join-example)

### SQL Overview

#### Simple Select

`SELECT ... AS ... FROM ... WHERE ... ORDER BY ... LIMIT ...`

#### Filter Statements

`CASE WHEN ... THEN ... ELSE ... END`, `AND`, `OR`, `BETWEEN`, `IN`, `LIKE`, `DATE`

#### Simple Join

Pattern:

`SELECT ... FROM ... JOIN ... ON ...`

Usage:

```
SELECT
    TableA.name 
    TableB.name
FROM
    TableA
JOIN
    TableB
ON
    TableA.id = TableB.referenceId
```

#### Modification Functions

`UPPER`, `LENGTH`, `REPLACE(value, signFrom, signTo)`, `IFNULL(value, default)`, `SUBSTR(column, index, lenght)`, `||`, `STRFDATE(dateformat, datevalue)`

#### Aggregation Functions

`SUM`, `AVG`, `MAX`, `MIN`, `COUNT`, and functional `ROUND(value, decimalDigitsNumber)`

#### Grouping

`GROUP BY`, `HAVING`

#### Nested

`IS`

#### Add row

`INSERT INTO ... VALUES ...`

#### Update row

`UPDATE ... SET ... WHERE`

#### Delete row

`DELETE FROM ... WHERE`

### SQLite Execute

In your local machine:

- Download and install [SQLite Browser](https://sqlitebrowser.org/dl/) app
- Open SQLite Browser app 
- Import database schema and data from [this](database/WSDA_Music.db) file
- Go to `Execute SQL` tab 
- Run following queries:

#### Join Example

**Tables:**

| Employee       |              | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Customer       |              |                  | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Invoice       |                |           |
|----------------|--------------|--------------------------------------------------------------|----------------|--------------|------------------|--------------------------------------------------------------|---------------|----------------|-----------|
|                |              |                                                              |                |              |                  |                                                              |               |                |           |
| **EmployeeId** | **LastName** |                                                              | **EmployeeId** | **LastName** | **SupportRepId** |                                                              | **InvoiceId** | **CustomerId** | **Total** |
|                |              |                                                              |                |              |                  |                                                              |               |                |           |
| 1              | Adams        |                                                              | 1              | Gonçalves    | 3                |                                                              | 1             | 2              | 1.98      |   
| 2              | Edwards      |                                                              | 2              | Köhler       | 5                |                                                              | 2             | 4              | 3.96      |
| 3              | Peacock      |                                                              | 3              | Tremblay     | 3                |                                                              | 3             | 8              | 5.94      |
| 4              | Park         |                                                              | 4              | Hansen       | 4                |                                                              | 4             | 14             | 8.91      |
| 5              | Johnson      |                                                              | 5              | Wichterlová  | 4                |                                                              | 5             | 23             | 13.86     |
| ...            |              |                                                              | ...            |              |                  |                                                              | ...           |                |           |

**Task:**

- What employees are responsible for the 10 highest individual sales?
- Return `Employee Lastname`, `Customer Lastname`, `Invoice Amount`.

**Solution:**
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

**Output:**

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

#### Join with Grouping Subquery Example

**Table**:

| User   |          |
|--------|----------|
|        |          |
| **Id** | **Name** |
|        |          |
| 1      | Yevhen   |
| 2      | Yevhen   |
| 3      | Yevhen   |
| 4      | John     |
| 5      | Sam      |
| 6      | Fred     |
| 7      | John     |
| 8      | Henry    |
| 9      | Henry    |
| 10     | Henry    |
| ...    |          |

**Task:**

- Which Users have the same names?
- Return `User ID`, `User Name`, `Duplication Amount`

```
SELECT 
  u.Id as `User ID`, 
  c.Name as `User Name`, 
  c.Amount as `Duplication Amount`
FROM 
  User u
JOIN 
  (SELECT 
      Name, COUNT(*) as Amount 
   FROM 
      User 
   GROUP BY 
      Name
   HAVING COUNT(*) > 1
   ) AS c
ON u.Name=c.Name
```

**Output**:

| User ID | User Name | Duplication Amount |
|---------|-----------|--------------------|
| 1       | Yevhen    | 3                  |
| 2       | Yevhen    | 3                  |
| 3       | Yevhen    | 3                  |
| 4       | John      | 2                  |
| 5       | Sam       | 1                  |
| 6       | Fred      | 1                  |
| 7       | James     | 1                  |
| 8       | John      | 2                  |
| 9       | Henry     | 2                  |
| 10      | Henry     | 2                  |
| ...     |           |                    |

