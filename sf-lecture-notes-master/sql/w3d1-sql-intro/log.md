# SQL

## February 26, 2018

Lecturer: Anastassia Bobokalonova
Scribe: Aaron Wayne

### Questions

+ What is the `<>`?
  + It is synonymous with `!=`
+ I missed the `DESC`
+ Can the end words in a heredoc be anything?
  + Yeah, basically anything.
+ Does the heredoc start and end have to be capitalized?
  + I don't think so, but it's convention
+ Is snake case convention for aliases?
  + Our DB is independent of the language we are using, but since I will
    be using it in ruby, I'll follow ruby convention for naming
+ The `COUNT(*)` sounds redundant. Does it ever not match up?
  + Yes, it skips `NULL` values
+ Can you only use one `DISTINCT` per `SELECT`
  + Yes, you have to put all columns into the same `DISTINCT` statement

## December 18, 2017
* Lecturer: Anastassia Bobokalonova
* Scribe: Andres Alfaro

### Questions
  + Can you truncate the 0's.
    + It depends on the DB Engine, there is TRIM() on pg, or a combinatin of LTRIM REPLACE, etc.
  + Do aggregate functions take into account NULLs.
    + Aggregates wont take into account NULL.
  + Can you use math on the aggregate comparisons?
     + Yes you can, you can also use more aggregates.

### Notes
  + _Play the question back_ sometimes is hard to hear the students.

## W3D1 / October 16, 2017
Lecturer: Anastassia Bobokalonova
Scribe: Aaron Wayne

### Questions
+ How would you use WHERE to compare to a specific row?
  - We can use a subquery, we will get into that later in lecture
+ Can we use DISTINCT to do this as well?
  - Yes, we will get to that
+ Can we not include the table name in the JOIN?
  - Yes, if the column name is distinct
+ How can we reference the entire table in the query?
  - You can't, you have to reference columns by the table they came from

## W3D1 / August 14, 2017
Lecturer: Aaron Wayne
Scribe: Anastassia Bobokalonova

### Questions:
+ What is ASC, DESC?
  - Short for ascending and descending for ordering.
+ Is any of this case-sensitive?
  - The convention in ruby/rails is lowercase, snake case for table names. You don't have to  capitalize these keywords but it's clearer for readers of your code.
+ Can you repeat about Having and Select?
  - HAVING is run before SELECT, so any aliases we make in SELECT are not available in HAVING.
+ If you don't do a GROUP BY, what item name will you get?
  - Any columns in your SELECT statement that are not in your GROUP BY need to have aggregators.
+ If you mess you and get one row, that doesn't affect your original table data?
  - That is correct.
+ What happens if you don't have a SELECT or GROUP BY?
  - The engine would throw an error.
+ Just to clarify, we only get back the Ricks from Rick and Morty query?
  - Yes, because we SELECTed the rick column.
+ Question about syntax, do you write what you're selecting on the same line?
  - Up to you, both are used. We use the convention that looks like Active Record.
+ Do you have to use the nested query to get the count?
  - I don't think we can use an aggregator on what we're grouping by.
+ What is the asterisk inside of count?
  - It gives you all of the columns provided from that table. As for count, you're just counting the number of rows, so it doesn't matter what we call it.
+ What is the percentage sign?
  - Matching any character.
+ If there's multiple columns in a table, is it like nested arrays?
  - I wouldn't worry about how SQL is implemented under the hood.
+ Will it automatically choose the table based on the order you write it?
  - We explicitly select the table name.
+ Can we write .aa_id instead of hack_reactor.aa_id?
  - Yes, because it is a unique identifier.
+ Do you have to JOIN a whole table, or can you use a subquery?
+ Would we not get two rows of Aaron?
  - No because we are using GROUP BY to collapse it.
+ If you GROUP BY multiple things, will it give you different combinations of those?
  - Yes, chain with commas and it will give you distinct combinations.
+ The default JOIN for sql is?
  - An inner join.
+ What happens if we use an OUTER LEFT JOIN?
  - We'll go over an example in a second.
+ What exactly is happening when we use a group by?
+ This (JOINS query) only works if we have this friendships table and we maintain it?
  - Yes.
+ Is that the ordering it will print out?
  - It'll depend on the way that you joined it.
+ It'll assign new primary keys for the joins table?
  - Yes. It'll assign new ids when you make a new relational table.
+ What do we call this new table?
  - You can call it a relational table.
+ Can you name a table as you JOIN it?
  - When we get to self joins, we'll talk about naming tables.
+ How do these work if you have multiple tables?
  - You always join two tables at a time, sequentially.
+ How does EXPLAIN work?
  - Put it before SELECT, it'll tell you your usage for different things.
+ What are heredocs?
  - A way to write multiline strings.


Lecturer: Kelly Chung
Scribe: Aaron Wayne

### Questions:
+ What is a database?
  - An excel sheet that you can't really see. (Before)
+ What is NoSQL
  - DB that specifically don't interact using SQL
+ What is the "/" operator (for "<> / !=")?
  - just shows they are the same
+ How to spell "heredoc"?
+ What is the space between wildcards?
+ Is 'largest' talking about area or population?
+ Do you need a semicolon for ruby?
  - Nope! ruby knows
+ In /d, is there a way to see it in a more readable way?
  - Not sure, walk through after lecture
+ Can you use and logic in limit?
  - No, only where and having
+ If we remove group by, will it error?
  - Will get into that
+ If we remove having, just group by, what would happen?
  - Same, it would just not filter out anything
+ Are you able to use OR in HAVING?
  - Yes
+ What is the data object that ruby returns in a heredoc?
  - will get back
+ What is the difference when a GROUP BY is not included?
  - Just sums that entire row
+ So 5 = NULL is false?
  - Yes
+ What if i want to get rid of duplicates and not get rid of columns?
  -  Select distinct on all columns or use a subquery, will get into that
+ Does the order matter for distinct?
  - No, order just structures table
+ Do SQL clauses need to be capitalized?
  - Absolutely not. It is convention for readability. Not functionally
  required
+ Doesn't select happen last (in relation to the alias)?
  - Yes, but the alias runs at the end of the query
+ Can we apply the count in the inner query instead?
  - No, it counts the rows that you are grouping by
+ Underscores or commas for large numbers in SQL?
  - Not that I know of :( will look into though
+ Does indent matter?
  - No SQL just parses it as a giant string
+ Can we abstract away subqueries and just reference it?
  - No, though there are programs that allow you to. Not built in to SQL
+ Is aliasing possible in the "Aust" example?
  - Yes, but not useful here.
+ What can you join on?
  - Anything. Convention is to have a foreign key
+ Do we only have to specify any other information for a join?
  - Give the table names and the linking columns
+ What if you joined them by primary keys?
  - Explains, most of the time it will be a primary to foreign key
+ What if I didn't want both columns to be referenced by the column
name 'name'?
  - alias it
+ What happens with the primary and foreign keys after join?
  - A new ID is assigned and the others are thrown away
+ Conceptually, where might you use this?
  - Appear in your full-stacks. Comments and Likes. Follows.
+ Does this friendships table exist, or is it conceptual?
  - This is a table that is manually created. It is a normal table that
  has the specific purpose of allowing the other two tables to be joined.
+ How do you account for direction (for follows)?
  - Have foreign ids that specify direction (follower, followee)
+ How do we join and display another column other than the referencing
ids?
  - Joins include the full table and the columns can be used in SELECT
+ Is a cross join a many to many relationship?
  - This is creating relationships from everything to everything,
  regardless of anything else. Just all combinations
+ Multiple tables in the from clause?
  - You must join them
+ Inner join can just be join?
  - yes, it is the default
+ What is the resultant table from the self join?
+ What is the SQL engine?

# W3D1 Intro to SQL

## Kelly teaches SQL 4/10/17

## Content
- What is the difference between date and datetime?
- Can you pass variables to `limit` instead of integers?
- Is this (Kelly's example) the style / format we want to follow?
- Please explain `ORDER BY` and `OFFSET`
- When do you need to use semi-colons?
- What's the difference between `SELECT` and `GROUP BY`
- Can you walk us through the order of operations for SQL?
- Can we omit `GROUP BY` and just sum all the values?
- Must aggregate functions go in the `HAVING` clause?
- Could you use an alias in a `HAVING` clause?
- Why use `HAVING` instead of `WHERE` ?
- Would you be able to define an alias inside of `HAVING` ?
- A question about the order in which the pieces of SQL queries are
executed
- Should you use an alias with aggregate functions?
- Do alias names have to be snake case?
- Why do we put a subquery in the `WHERE` instead of the `FROM` clause
- Do you need to manually connect the foreign key to the id?
- Can a table have multiple foreign-key columns?
- Must the foreign keys have certain names?
- A question about how left outer joins work
- A question about what the different id's in a join table represent
- A question about when naming join tables happens in a SQL query
- Why wouldn't you do a right outer join?
- What if there are many self joins relationships for a table? Like
if a manager has many employees?
- Does the kevin bacon example need include an outer join?
- In a SQL query, will all the joins execute before the filter?


###Notes
- good job telling people to save their questions until the end
of a section
- make lecture slides fullscreen
- when using the whiteboard, write really big and be mindful of blocking
with your body
- make sql lecture video plz
