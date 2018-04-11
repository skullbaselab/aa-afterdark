[Feb cohort:  Fred](./previous_lectures/february2016.sql)  
[June cohort:  Leen](./previous_lectures/june2016)  
[Aug cohort:  Fred](./previous_lectures/august2016)  

## Solutions prep

**Expect questions on:**
+ LRU cache -- be ready to explain/draw how the moving parts come together
+ Amortization. Resizing is expensive, but for every n extra units you create, you guarantee n free insertions! Not average runtime analysis because no assumptions/probability involved. AMORTIZED runtime analysis.


## Lecture

**1) SQL**
+ Need to persist information
+ SQLite (smaller, not many connections, like phone) vs PostgreSQL (which we'll need for heroku)
  + Today psql, tomorrow sqlite3
  + psql databases deep inside computer, delete with `dropdb` in terminal, sqlite3 an actual local file you can delete
+ create and open a database in terminal
+ `\?, \h, \d, \l`..all useful things to know

**2) Single table queries**
+ This section should be relatively quick. Don't need to write entire query for every one.
+ WHERE (=, !=, LIKE, BETWEEN, IS NULL, IN, AND, OR)
+ Customize output
  + SELECT: * , COALESCE, CASE WHEN END, DISTINCT
  + End of query: LIMIT/ORDER

**3) Grouping**
+ WHERE vs HAVING
+ GROUP is like squashing all the rows having a common column into one output row. You can SELECT things that they all have in common, or aggregate functions of other columns
  + Good to show error: 'You must group by xxx.xxx or use aggregate function' when you SELECT a column that is not grouped.
+ Aggregate functions: MAX, COUNT, AVG, etc.
+ Good practice to COUNT by primary key
  + Primary ID is always unique and present

**4) Subqueries and Joins**
+ Subqueries
  + Run before outside query
  + Can return a single value or a single column for WHERE filters
+ JOIN
  + Default INNER JOIN
  + Show `SELECT *` with INNNER JOIN, and LEFT OUTER JOIN
  + Shouldn't need to use RIGHT OUTER JOIN bc all problems that could use ROJ can also use LOJ
+ join tables
  + Necessary when you have many-to-many relationship instead of one-to-many
  + Show `SELECT *` with mega table!
