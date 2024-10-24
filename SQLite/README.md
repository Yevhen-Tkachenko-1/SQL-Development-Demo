# SQLite-Demo
_Learn and play with SQLite Database: make query for data reading, creating, updating, deleting_

Implemented based on LinkedIn learning course:
[SQL Essential Training](https://www.linkedin.com/learning/sql-essential-training-20685933)

### Local set up

To be ready execute queries: 
- Download and install [SQLite Browser](https://sqlitebrowser.org/dl/) app.
- Open SQLite Browser app and import database schema and data from [this](database/WSDA_Music.db) file.

### Run queries

Open SQLite Browser app, go to `Execute SQL` tab and paste queries from next examples:

- Simple select [query](query/01-select.sql): `SELECT AS`, `WHERE`, `ORDER BY`, `LIMIT`
- Filter [query](query/02-filter.sql): `CASE WHEN ... THEN ... ELSE ... END`, `AND`, `OR`, `BETWEEN`, `IN`, `LIKE`, `DATE`
- Join [query](query/03-join.md): `INNER JOIN ... ON ...`
- Modification Functions [query](query/04-modification-functions.sql): `UPPER`, `LENGTH`, `REPLACE(value, signFrom, signTo)`, `IFNULL(value, default)`, `SUBSTR(column, index, lenght)`, `||`, `STRFDATE(dateformat, datevalue)`
- Aggregation Functions [query](query/05-aggregation-functions.sql): `SUM`, `AVG`, `MAX`, `MIN`, `COUNT`, and functional `ROUND(value, decimalDigitsNumber)`
- Grouping [query](query/06-grouping.md): `GROUP BY`, `HAVING`
- Nested [query](query/07-subquery.sql):  `IS`
- Add, update, delete [queries](query/08-modification.sql): `INSERT INTO ... VALUES ...`, `UPDATE ... SET ... WHERE`, `DELETE FROM ... WHERE` 