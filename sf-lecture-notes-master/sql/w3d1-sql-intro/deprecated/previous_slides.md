### A02 is over!

---

# Introduction to SQL

---

### Lecture Structure

1. Code Demos throughout
1. Cover Concepts and Syntax
1. Review Section / Questions
1. Open Forum

---

### Lecture Agenda

1. What is SQL?
1. Schema
1. The Basics of SELECT queries
1. Grouping and Aggregate Functions
1. Subqueries
1. JOIN's

---

### What is SQL?

  1. 'Structured Query Language'
    + Pronounced 'sequel'
  2. Domain-specific Language (**DSL**) for _relational_ databases
    + declarative programming

Note:
Examples of DSLs: HTML, Markdown, Unix shell
Difference: general languages lack specialized features for a particular domain
---

### RDBMS

- "Relational DataBase Management System"
- Store data at scale
- Represent relationships between data

---

### Flavors of SQL

All of these databases support SQL, but differ in implementation and
additional features.

- PostgreSQL, aka Postgres
  - We'll be using this today, and for most projects
- SQLite
  - Some projects use this
- MySQL
- Oracle DB
- Microsoft SQL Server

---

### Stack Overflow Developer Survey 2017
https://insights.stackoverflow.com/survey/2017#technology
---

## Schema

the structure of your database

Note:
The tables, columns of each table, and data types for each column.
Changing schema is possible, but can be difficult with data already in the DB.

---

### `psql`

- `$ psql sqlzoo`
- `\d` - list tables
- `\d table` - show schema for table
- `\?` to list meta commands
- end queries with a `;`

---

### Column Types

Every column must have a data type specified. Some common types:

- `varchar`
- `boolean`
- `integer`
- `float`
- `date`
- [many, many
more](https://www.postgresql.org/docs/current/static/datatype.html#DATATYPE-TABLE)

---

## Basics of SELECT queries

---

### SELECT + FROM

- SELECT: choose which columns to extract data from
- FROM: specifies the _relation_ you're getting data from

---

### WHERE

- Filters the data according to a logical expression
- `=`, `>=`, `<=`, `>`, `<`, `<>` / `!=`
- `IN`, `BETWEEN`, `LIKE`
- `AND`, `OR`

---

### ORDER BY

- Sorts results based on a specific column
- Primary, Secondary, Tertiary, etc. columns
- `ASC` or `DESC` - defaults to ASC

---

### LIMIT

- specifies how many rows you want in the result

---

### OFFSET

- specifies how many rows you want to skip from the top

---

### Example 1

Note:
Tracking `food`


SELECT *
FROM food
WHERE name = 'apple';

---

#### Basic Clauses Review

1. `SELECT`
2. `FROM`
3. `WHERE`
  - `=`, `>=`, `<=`, `>`, `<`, `<>`/`!=`
  - `IN`, `BETWEEN`, `LIKE`
  - `AND`, `OR`
4. `ORDER BY`
  - `ASC` or `DESC`
5. `LIMIT`
6. `OFFSET`

---

### Grouping and Aggregate Functions

---

#### Aggregate Functions

Combines data from multiple rows into a single value.

- `COUNT`
- `SUM`
- `AVG`
- `MIN`/`MAX`
- [and
more](http://www.postgresql.org/docs/9.4/static/functions-aggregate.html)

---


#### `GROUP BY`

- Groups rows with matching values for given criteria.
- Collapses each group of rows into a single row.
- Use aggregate functions to determine the column values for each
grouped row. (watch out for this error)

---

Without a `GROUP BY` clause, the entire result is reduced to one row.

```sql
SELECT
  SUM(calories) AS total_calories
FROM
  food
```

**Note** -  You should _always_ use an alias with aggregate functions.

---

#### `HAVING`

- Works like `WHERE`, but...
  - `WHERE` gets evaluated **_before_** `GROUP BY`.
  - `HAVING` gets evaluated **_after_** `GROUP BY`.
  - You must use **aggregate functions** in `HAVING`.
- You can't use aliased names in `HAVING` :(

---

### Example 2

Note:
SELECT (6)
FROM (1)
JOIN (2)
WHERE (3)
GROUP BY (4)
HAVING (5)
ORDER BY (7)
LIMIT (8)
OFFSET (9)

SELECT foodtype, SUM(calories) AS total_calories
FROM food
GROUP BY foodtype
HAVING SUM(calories) > 100
ORDER BY total_calories
OFFSET 1;

---


#### `GROUP BY` & `HAVING` Review

##### `GROUP BY`

- Groups rows with matching values for given criteria.
- Collapses each group of rows into a single row.
- Use aggregate functions to determine the column values for each
grouped row.

##### `HAVING`

- Works like `WHERE`, but...
- `HAVING` gets evaluated **_after_** `GROUP BY`.
- You must use **aggregate functions** in `HAVING`.
- You can't use aliased names in `HAVING` :(

---

### Advanced Topics

---

#### `DISTINCT`

- De-duplicates data in a result (like `Array#uniq`)
- **NOT** an aggregate function - It returns multiple results.
- Use it in the `SELECT` clause or inside an aggregate function.
  - `SELECT DISTINCT first_name, last_name`
    - filters duplicate combinations of first and last name
  - `SELECT COUNT(DISTINCT name)`
    - doesn't count duplicate values

---

#### `NULL` is weird.

Comparisons to `NULL` don't work in SQL.

- `NULL = NULL` => `false`
- `5 != NULL` => `false`

Use `IS NULL` and `IS NOT NULL`.

---

### Example 3

---

![Rick](http://overmental.com/wp-content/uploads/2015/10/rick-and-morty-ricks-station-750x413.jpg)

---

#### Advanced Topics Review

- `DISTINCT`
- `NULL`

---
### Subqueries

Sometimes it's useful to use the result of a query inside another query.


```sql
SELECT
  COUNT(*)
FROM (
    SELECT
      continent
    FROM
      countries
    GROUP BY
      continent
    HAVING
      SUM(population) > 500000000
  ) AS populous_continents;
```

---

#### Another Subquery

Get all the countries in continents with a country that starts with
"Aust".

In subquery words...

There are continents that contain at least one country that starts with "Aust". Get all of the countries that are in those continents.

_Hint_ - Use `IN`

---

```sql
SELECT
  name, continent
FROM
  countries
WHERE
  continent IN (
    SELECT
      DISTINCT continent
    FROM
      countries
    WHERE
      name LIKE 'Aust%'
  );
```

---

#### Final notes on subqueries

- You can also use them in `FROM` as well as `WHERE`.
- If in `FROM`, you must use `AS` to alias the subquery.
- You can use them for `WHERE NOT IN`, not just `WHERE IN`

---

# 5 minute break

---

### Joins

- Joins put the _R_ in RDBMS.
- Combine data from multiple tables into one _relation_.
- Uses _"foreign keys"_ (ids that point to each other).

---

#### Basic Joins

Allow for one-to-many relationships.

![onemany](http://kwiznet.com/px/homes/i/Grade9/Relations/Relations_Types_of_Relations_Dia_Question_No3.gif)
Note: Board time
SELECT * FROM food JOIN favorite_food ON food.id = favorite_food.food_id;

---

```sql
SELECT
  food.name, food_log.fname
FROM
  food
  JOIN food_log
    ON food.id = food_log.food_id;
```

---

##### Join and Group

Find the total number of foods eaten by each person

```sql
SELECT
  food_log.fname,
  COUNT(*) AS total_foods
FROM
  food
JOIN food_log
  ON food.id = food_log.food_id
GROUP BY
  food_log.fname;
```

---

![joins](http://www.johns-jokes.com/afiles/images/sql-joins-two-tables.jpg)

---

### Basic Joins Review

- Combine data from multiple tables into one _relation_.
- Uses "foreign keys" (ids that point to each other).

---

#### Join Tables

Allow for many-to-many relationships.

![many-many](http://kwiznet.com/px/homes/i/Grade9/Relations/Relations_Types_of_Relations_Dia_Question_No7.gif)

Note: Board time

---

##### What the SQL looks like

```sql
SELECT
  *
FROM
  app_academy
  JOIN friendships
    ON app_academy.id = friendships.aa_id
  JOIN hack_reactor
    ON hack_reactor.id = friendships.hr_id
```

---

##### Join Tables Review

- Connects two other tables through a Join Table
- The Join Table has a _foreign key_ reference to both tables.

---

#### Common Types of Join

```sql
table1 _____ JOIN table2
```

- `INNER JOIN`
  - returns only rows from `table1` and `table2` that match each other
  - this is the default
- `LEFT OUTER JOIN`
  - returns all rows in `table1`, whether or not they match `table2`

[Visualizing the
options](http://blog.codinghorror.com/a-visual-explanation-of-sql-joins/).

---

#### Uncommon Types of Join

- `FULL OUTER JOIN`
  - returns all rows in `table1` and `table2`, whether or not they match
  - not supported in all engines
- `CROSS JOIN`
  - Returns the cartesian product of `table1` and `table2`
    - `result.size = table1.size * table2.size`
  - **Never do this**

---

#### Join Types Review

- `INNER JOIN`
  - returns only rows from `table1` and `table2` that match each other
- `LEFT OUTER JOIN`
  - returns all rows in `table1`, whether or not they match `table2`
- `FULL OUTER JOIN`
  - returns all rows in `table1` and `table2`, whether or not they match
- `CROSS JOIN`
  - Returns the cross product of `table1` and `table2`
  - **NO**

---

#### Self Joins

- Joins a table back against itself.
- May involve a separate join table (movies & castings).
- You must alias the table.
- Use descriptive aliases.

Note:
Board time (add in pod_leader_id to aa table)

---

##### Example

Get the names of all actors who've been in movies with Kevin Bacon

---

```sql
SELECT DISTINCT
  other_actors.name
FROM
  actors AS kevin_bacon
  JOIN castings AS kevin_bacon_castings
    ON kevin_bacon_castings.actor_id = kevin_bacon.id
  JOIN castings AS other_castings
    ON other_castings.movie_id = kevin_bacon_castings.movie_id
  JOIN actors AS other_actors
    ON other_actors.id = other_castings.actor_id
WHERE
  kevin_bacon.name = 'Kevin Bacon'
  AND other_actors.name != 'Kevin Bacon';
```

Why don't we need to join `movies`?

---

#### Subqueries vs. Joins

- Subqueries use less memory than joins.
- Subqueries use more CPU than joins. (CPU is usually the bottleneck.)
- In practice, this differs between SQL engines. Use `EXPLAIN` and
benchmarks if performance is a concern.

---

### Quiz Solutions

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/sql/w3d1.md)

---

## Today

- Look at the examples. They're important.
- Look at the _schema_.
- See tips at bottom of project instructions.
- Use heredocs.
- Do bonus at the end.

---

# Open Forum

---
