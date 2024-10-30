# PostgreSQL Demo

_Learn and play with PostgreSQL Database_

Implemented based on LinkedIn learning course:
[PostgreSQL Essential Training](https://www.linkedin.com/learning/postgresql-essential-training-22611610)

## Prepare

- Install PostgreSQL Server on your machine which is actual RDBMS
- Install pgAdmin desktop app which is client for working with PostgreSQL Server
- Install PSQL tool which is alternative client for working with PostgreSQL Server

In this demo we will use pgAdmin app.

## Theory

PostgreSQL's data structure at top level looks like this:

![](image/1.PNG)

- Top elements are server groups which are used 
  to separate different PostgreSQL Servers
  running in different data centers, e.g. `local`, `AWS`, `On-premises` 
  or in different environments like `dev`, `test`, `prod`.
- Next we see `PostgreSQL 17` as the specific Server running on our local
- Inside PostgreSQL Server we can have multiple databases 
  which is secure logical separation of resources. 
  This way we can have different databases for different purposes, e.g. `dev`, `test`, `prod`
  without having multiple physical Servers.
  In our case we have `metadata` and `postgres` databases

Inside database, we have next structure:

![](image/2.PNG)

- Schemas are used to group different tables by domain, 
  like schemas `assests`, `people`, `public` in our case.
- Finally, inside schema, we have tables with columns


## Practice

#### Solution to the challenge: Create Table

Create new Table named `barries` in default `public` schema: 
```
CREATE TABLE public.barries
(
    barry_id serial NOT NULL,
    barry_name character varying(50) NOT NULL,
    colors character varying(50)[] NOT NULL,
    relative_size smallint DEFAULT 5,
    discovery_regions character varying(50)[],
    discovery_date date,
    PRIMARY KEY (barry_id),
    CONSTRAINT relative_size_range_check CHECK (relative_size BETWEEN 1 AND 10) NOT VALID
);
```
In `pgAdmin` app &#8594; `barries` table &#8594; `SQL` tab it will look like this:

![](image/3.PNG)

Insert data to `barries` table:

```
INSERT 
    INTO public.barries 
        (barry_name,    colors,                         discovery_regions,                discovery_date,     relative_size) 
    VALUES
        ('Blueberry',   ARRAY['blue', 'purple'],        ARRAY['North America', 'Europe'], '1900-01-01'::date,             4),
        ('Strawberry',  ARRAY['red', 'pink'],           ARRAY['Europe', 'North America'], '1300-01-01'::date,             5),
        ('Raspberry',   ARRAY['red', 'black'],          ARRAY['Europe', 'Asia'],          '1500-01-01'::date,             6),
        ('Blackberry',  ARRAY['black', 'dark purple'],  ARRAY['North America', 'Europe'], '1600-01-01'::date,             7),
        ('Cranberry',   ARRAY['red'],                   ARRAY['North America'],           NULL,                           5),  -- NULL for discovery_date
        ('Gooseberry',  ARRAY['green', 'yellow'],       ARRAY['Europe', 'Asia'],          NULL,                           3),  -- NULL for discovery_date
        ('Mulberry',    ARRAY['black', 'white', 'red'], ARRAY['China', 'India'],          NULL,                           6),  -- NULL for discovery_date
        ('Elderberry',  ARRAY['purple', 'black'],       ARRAY['Europe', 'North America'], '1000-01-01'::date,             5),
        ('Huckleberry', ARRAY['blue', 'purple'],        ARRAY['North America'],           '1900-01-01'::date,             4),
        ('Salmonberry', ARRAY['yellow', 'orange'],      ARRAY['Pacific Northwest'],       NULL,                           3);  -- NULL for discovery_date
```

In `pgAdmin` app &#8594; `barries` table &#8594; `All Rows` button it will look like this:

![](image/4.PNG)