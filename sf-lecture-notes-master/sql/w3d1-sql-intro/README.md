# Introduction to SQL

---

### Lecture Structure: 14 Questions

* A lot of material:
  * 14 Questions and Answers (break after question 7)
* Code Demos throughout
* Quiz

Save your questions to before break and before lunch!

---

### 1. How can we store information?

---

### Answer: Databases!

"Relational DataBase Management System" (RDBMS): stores data at scale and represents relationships between data.

Popular ones:
- PostgreSQL, aka Postgres (open source)
  - We'll be using this today, and for most projects
- SQLite (open source)
  - Tomorrow's project uses this
- MySQL (open source)
- Oracle DB
- Microsoft SQL Server

---

Let's see the demo data, first in excel.

---

### Opening PostgreSQL (psql):

- (`$ cat demo/setup_lecture_demo.sql | psql lecture`)
- `$ psql lecture`
- `\d` - list tables
- `\d table` - show schema for table
- `\?` to list meta commands
- end queries with a `;`

---

### 2. How can we access the data?

---

### Answer: With SQL!

* SQL is 'Structured Query Language'
* It's a domain-specific language (**DSL**) for _relational_ databases (other DSLs: HTML, Markdown, Unix shell scripting)
* Uses declarative programming
* SQL is extremely popular: https://insights.stackoverflow.com/survey/2017#technology

---

### 3. What are the basics of SQL queries?

---

### Answer part 1:

* `SELECT` : choose which columns to extract data from
* `FROM`: specifies the _relation_ (table) you're getting data from.
* `WHERE`: filters the data according to a logical expression
  - `=`, `>=`, `<=`, `>`, `<`, `<>`/`!=`
  - `IN`, `BETWEEN`, `LIKE`, (`%`)
  - `AND`, `OR`
  - Comparisons to `NULL` don't work in SQL. Use `IS NULL` and `IS NOT NULL`.

Query: Get the names of all app academy instructors.

---

Query: Get the names of all app academy instructors.

```sql
SELECT
  app_academy.name
FROM
  app_academy;
```

---

### Answer part 2:

* `ORDER BY`: Sorts results based on a specific column
  - `ASC` or `DESC`
* `LIMIT`: how many rows you want in the result
* `OFFSET`: how many rows you want to skip from the top

Query: Get the name & cost of the second most expensive possession whose name has at least two words.

---

Query: Get the name & cost of the second most expensive possession whose name has at least two words.

```sql
SELECT
  name, cost
FROM
  possessions
WHERE
  name LIKE '% %'
ORDER BY
  cost DESC
LIMIT
  1
OFFSET
  1;
```
---

### 4. Can I write SQL code in ruby files?

---

### Answer: Yes!

* Write an "execute" function to handle DB connection
* Enter SQL queries into "heredocs" (multi-line strings)
* This is how you'll be writing SQL today (to run specs), but please also use the `psql` interface to debug and see what your queries return.

---

### 5. What if I want to do calculations on my data?

---

### Answer: Use Aggregate Functions

Aggregate functions combines data from multiple rows into a single value.
* You should _always_ use an alias with aggregate functions.
* `COUNT`, `SUM`, `AVG`, `MIN`/`MAX`, [and
more](http://www.postgresql.org/docs/9.4/static/functions-aggregate.html)

Query: Get the average cost of all possessions.

---

Query: Get the average cost of all possessions.
```sql
SELECT
  AVG(possessions.cost) AS avg_cost
FROM
  possessions;
```

---

### Aside: How to deal with duplicate data? Use `DISTINCT`.

* `DISTINCT`: De-duplicates data in a result (like `Array#uniq`). Returns multiple results.
  - Use it in the `SELECT` clause or inside an aggregate function.
  - `SELECT DISTINCT name, owner_id`
    - filters duplicate combinations of objects and their owners.
  - `SELECT COUNT(DISTINCT name)`
    - doesn't count duplicate values

Query: Get the distinct names of possessions.
---

Query: Get the distinct names of possessions.
```sql
SELECT
  DISTINCT(possessions.name)
FROM
  possessions;
```

---

### 6. What if I want to group my data?

---

### Answer: use GROUP BY and HAVING!

- `GROUP BY` groups rows with matching values for given criteria. Collapses each group of rows into a single row.
- Use aggregate functions to determine the column values for each grouped row. (watch out for this error!)
- Without a `GROUP BY` clause, the entire result is reduced to one row.

Query: For each type of possession, show the type and number of each.

---
Query: For each type of possession, show the type and number of each.

```sql
SELECT
  type, COUNT(*)
FROM
  possessions
GROUP BY
  type;
```

What about types of possessions that have greater than 5 items?

---

### 7. What is the order of operations in SQL?

---

### Answer

1. FROM
1. JOIN
1. WHERE
1. GROUP BY
1. HAVING
1. SELECT
1. ORDER BY
1. LIMIT / OFFSET

(Why can't you use aliased names in `HAVING`?)

---

### WHERE vs HAVING

- `HAVING` works like `WHERE`, but...
  - `WHERE` gets evaluated **_before_** `GROUP BY`.
  - `HAVING` gets evaluated **_after_** `GROUP BY`.
  - You must use **aggregate functions** in `HAVING`.

---

# 5 minute break

---

### 8. Can I use the result of a query in a different query?

---

### Answer: Yes-- Use a subquery!
Sometimes it's useful to use the result of a query inside another query. This is a _Subquery_.

- You can also use them in `FROM` as well as `WHERE`.
- If in `FROM`, you must use `AS` to alias the subquery.
- You can use them for `WHERE NOT IN`, not just `WHERE IN`

Query: Of the most common item, list the ones that cost over $1000.

---
Query: Of the most common item, list the ones that cost over $1000.

```sql
SELECT
  *
FROM
  possessions
WHERE
  name IN (
    SELECT
      name
    FROM
      possessions
    GROUP BY
      name
    ORDER BY
      COUNT(*) DESC
    LIMIT
      1
  ) AND cost > 1000;
```

---

### Subquery Pop Quiz:

Query: How many types of possessions have total cost over $200?

(Hint: use _FROM_ instead of _WHERE_.)
---

Query: How many types of possessions have total cost over $200?

```sql
SELECT
  COUNT(*) AS num_types
FROM (
  SELECT
    type, SUM(cost)
  FROM
    possessions
  GROUP BY
    type
  HAVING
    SUM(cost) > 200
  ) AS pricey_possessions;
```

---

### 9. I have a lot of data... how can I represent relationships among data?

---

### Answer: Joins

- Break data up into tables (relations).
- Store foreign keys (ids pointing to data in other tables) in a column.
- Combine data from multiple tables into one _relation_ with JOIN.
- Joins put the _R_ in RDBMS.
- Types of relationships between data:
	- One-to-many
  - Many-to-many

---

### 10. How to join one-to-many data?
![onemany](http://kwiznet.com/px/homes/i/Grade9/Relations/Relations_Types_of_Relations_Dia_Question_No3.gif)

---

### Answer: use foreign keys!
- Use "foreign keys": ids that point to each other.
- Combines data from multiple tables into one _relation_.

Query: Get all of the possessions owned by a person.

---

Query: Get all of the possessions owned by a person.

```sql
SELECT
  app_academy.name AS owner_name, possessions.name AS possession_name
FROM
  app_academy
  JOIN possessions
    ON app_academy.id = possessions.owner_id;
```

---

### Pop Quiz
Query: Find the _total number_ of possessions owned by each person

---

Query: Find the _total number_ of possessions owned by each person

```sql
SELECT
  app_academy.name AS owner_name,
  COUNT(*) AS total_possessions
FROM
  app_academy
  JOIN possessions
    ON app_academy.id = possessions.owner_id
GROUP BY
  app_academy.name;
```

---

### 11. How to join many-to-many data?
![many-many](http://kwiznet.com/px/homes/i/Grade9/Relations/Relations_Types_of_Relations_Dia_Question_No7.gif)

---

### Answer: Use a join table!
- Connects two other tables through a Join Table
- The Join Table has a _foreign key_ reference to both tables.

Query: Get all the friendships between app academy and hack reactor people.

---

Query: Get all the friendships between app academy and hack reactor people.

```sql
SELECT
  *
FROM
  app_academy
  JOIN friendships
    ON app_academy.id = friendships.aa_id
  JOIN hack_reactor
    ON hack_reactor.id = friendships.hr_id;
```

---

### 12. Are there different ways to JOIN tables?

---

### Answer:

- `INNER JOIN`
  - returns only rows from `table1` and `table2` that match each other. This is the default.
- `LEFT OUTER JOIN`
  - returns all rows in `table1`, whether or not they match `table2`. Not supported by all engines.
- `FULL OUTER JOIN`
  - returns all rows in `table1` and `table2`, whether or not they match
- `CROSS JOIN`
  - Returns the cross product of `table1` and `table2`
  - **You never need this**

---

### 13. Whats the difference between using subqueries and joins?

---

### Answer
- Subqueries use less memory than joins.
- Subqueries use more CPU than joins. (CPU is usually the bottleneck.)
- In practice, this can differ between SQL engines. Use `EXPLAIN` and
benchmarks if performance is a concern.

---

### 14. What is a self-join?

---

### Answer
- Joins a table back against itself.
- You must alias the table.
- Use descriptive aliases.
- May involve a separate join table (movies & castings).

Query: Get all of the app academy instructors who are also pod leaders.

---

Query: Get all of the app academy instructors who are also pod leaders.

```sql
SELECT
  DISTINCT(pod_leaders.name)
FROM
  app_academy AS instructors
  JOIN app_academy AS pod_leaders
  ON instructors.pod_leader_id = pod_leaders.id;
```

---
### Review
1. How can we store information?
2. How can we access the data?
3. What are the basics of SQL queries?
4. Can I write SQL code in ruby files?
5. What if I want to do calculations on my data?
6. What if I want to group my data?
7. What is the order of operations in SQL?

---
### Review
8. Can I use the result of a query in a different query?
9. How can I represent relationships among data?
10. How to join one-to-many data?
11. How to join many-to-many data?
12. Are there different ways to JOIN tables?
13. Whats the difference between using subqueries and joins?
14. What is a self-join?

---

### Quiz Solutions

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/sql/w3d1.md)

---

## Today

- Look at the examples. They're important.
- Look at the _schema_.
- Use heredocs to write the queries.
- Try your queries with `psql`.
- See tips at bottom of project instructions.
- Do bonus at the end.

---

## Thank you!

---
