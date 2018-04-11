# Subqueries

* SQL queries, on their own, do not have access to outside or additional information. If you need data from a specific row or a specific table to finish your query, you need either a join or a **subquery**.

* Subqueries may be used in the `WHERE` clause as well as the `FROM` clause. `WHERE` is more common, but you may want to use one in `FROM` if you are `JOIN`ing to another table - joins are expensive, so subqueries that narrow the initial dataset can save you time.
  * This isn't terribly relevant to the scale of data used in the course though - most subqueries at a/A involve the `WHERE` clause.

* Go over `larger_than_russia` as a simple example of a subquery, then go more in-depth with something like `sparse_continents`, which people tend to struggle on.
    * Go over the "intuitive solution" to `sparse_continents` (a subquery for continents with countries with a population < 25,000,000) and explain why the logic is flawed (or ask the students to figure it out for themselves!)

```rb
def larger_than_russia
  # List each country name where the population is larger than 'Russia'.
  execute(<<-SQL)
    SELECT
      c1.name
    FROM
      countries c1
    WHERE
      c1.population > (
        SELECT
          c2.population
        FROM
          countries c2
        WHERE
          c2.name = 'Russia'
      );
  SQL
end
```

```rb
def sparse_continents
  # Find every country that belongs to a continent where each country's
  # population is less than 25,000,000. Show name, continent and
  # population.
  # Hint: Sometimes rewording the problem can help you see the solution.
  execute(<<-SQL)
    SELECT
      c1.name,
      c1.continent,
      c1.population
    FROM
      countries c1
    WHERE
      c1.continent NOT IN (
        SELECT
          c2.continent
        FROM
          countries c2
        WHERE
          c2.population >= 25000000
      );
  SQL
end
```