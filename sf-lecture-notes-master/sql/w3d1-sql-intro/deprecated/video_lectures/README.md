# Intro to SQL

## What is SQL?

- How to pronounce
- Structured Query Language
- Relational database management system (DBMS)
  - How do we store relationships? Pointers to IDs.
  - It is often convenient to have a table that stores data only about
    relationships (join tables)

## Why SQL?

- Graph databases are taking off
- Relational databases (like SQL) is not even close to hot right now,
  yet the most widely used
- Active Record: ruby wrapper for SQL
- SQL is the language of relational databases

## Flavors of SQL

- postgreSQL, a.k.a. Postgres
- SQLite3
  - very convenient because it saves your data in a file that is easy to
    access; can even store in your Git repository
  - not good for production, but great for practice

## Details

### Static Typing

Every column must have a data type specified. Some common types:
  - `string` (length restricted to <= 255 characters)
  - `text` (length has virtually no upper limit: 2^31 - 1)
  - `boolean`
  - `float`
  - `integer`
  - `date`

### Schema

A way to describe the structure of your database. You'll usually see a
line for each column in a table, represented like so:

data_type "column_name" [null: false or other constraints like default]

You can also draw up a visual representation of a schema to help you
understand how your data is related. We like to do this with boxes and
single or forked lines.

### Writing Queries

#### SQL Code Style

You MUST write good, clean SQL. This means capitalizing keywords and
using line breaks liberally. It may feel weird at first but you will
look like a joke if you don't do it.

#### SELECT, FROM, DISTINCT, WHERE, ORDER BY, LIMIT

- SELECT lets you choose which columns you want in your results.
  - Columns can be aliased (renamed) with AS
- FROM specifies the table you're SELECTing from (this can be the result
  of a sub-query or a JOIN operation).
  - Tables can also be aliased with AS
- DISTINCT de-duplicates data in the results (like Ruby's Array#uniq)
- WHERE lets you filter data; like Ruby's Array#select, you pass a
  condition that evaluates to true/false
  - WHERE allows you to check for:
    - equality: `WHERE lname = 'Stark'`
    - inclusion: `WHERE lname IN ('Stark', 'Baratheon')`
    - string matching: `WHERE lname LIKE '%a%'`
    - and more!
- ORDER BY lets you specify one (or more) columns to order the results
- LIMIT lets you specify how many results you want

Get all the houses:

```sql
SELECT
  *
FROM
  houses;
```

Only the house words:

```sql
SELECT
  words
FROM
  houses;
```

Get all the surnames:

```sql
SELECT
  DISTINCT lname
FROM
  characters;
```

Get the first five Starks ordered by name:

```sql
SELECT
  *
FROM
  characters
WHERE
  lname = 'Stark'
ORDER BY
  fname
LIMIT
  5;
```

#### SELECT within SELECT (subqueries)

Sometimes it's useful to make a query on a data set that is itself the
result of a query.

Get the characters who share a surname with a Robb or Robert:

```sql
SELECT
  characters.*
FROM
  characters
WHERE
  lname IN (
    SELECT
      lname
    FROM
      characters
    WHERE
      fname LIKE '%Rob%'
  );
```

#### GROUP BY, HAVING, aggregate functions

GROUP BY lets you collapse results that share a value in a column. This
is useful if you want to count how many records match a particular
condition, or perform statistics or aggregate functions on the data.

HAVING is like WHERE in that it lets you specify conditions; the
difference is that WHERE happens before grouping, and HAVING happens
after. So if you want to filter data using aggregate functions, you MUST
use a HAVING clause.

Get the surname with the most members, along with the number of members:

```sql
SELECT
  lname, COUNT(id) AS count
FROM
  characters
GROUP BY
  lname
ORDER BY
  COUNT(id) DESC;
```

#### JOINS

- Types:
  - INNER (removes non-matching rows on both sides of the join)
  - LEFT OUTER (includes non-matching rows on the left side)
  - RIGHT OUTER (includes non-matching rows on the right side; not
    always supported)
  - CROSS (includes non-matching rows on the left and right side; almost
    always a bad idea).

Find the characters who are members of House Baratheon:

```sql
SELECT
  characters.*
FROM
  characters
JOIN
  house_memberships ON characters.id = house_memberships.character_id
JOIN
  houses ON house_memberships.house_id = houses.id
WHERE
  houses.name = 'Baratheon';
```

Find the house with the most members:

```sql
SELECT
  houses.name, COUNT(*) AS count
FROM
  houses
JOIN
  house_memberships ON houses.id = house_memberships.house_id
GROUP BY
  houses.id
ORDER BY
  COUNT(*) DESC
LIMIT
  1;
```

#### NULL, CASE, CAST, COALESCE

- NULL is weird.
  - NULL = NULL is false
  - NULL != NULL is also false
  - to check for "null-ness", you need to use IS NULL or IS NOT NULL
- CASE allows you to "massage" the data more than usual

```sql
SELECT
  characters.*,
  CASE
    WHEN characters.lname = 'Stark' THEN 'Good guy'
    ELSE 'Bad guy'
  END AS faction
FROM
  characters;
```

- CAST allows you to switch data types: `CAST("5" AS INTEGER)`
- COALESCE lets you specify a default value if none is found:
  `COALESCE(characters.lname, 'Snow')`
