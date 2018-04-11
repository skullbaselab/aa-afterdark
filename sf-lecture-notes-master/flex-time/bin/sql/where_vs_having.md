# WHERE vs. HAVING

* Both clauses serve to narrow down information. `WHERE` happens before the query is made, `HAVING` happens after.
    * Basically, the reason aggregator functions only work in HAVING is because you can only aggregate data you already have. The only way to retreive data is to complete a query. 
    * `GROUP BY` is required because aggregate functions need to know what to aggregate by.

* You could just make `WHERE` happen after a query is made, but this is not ideal for several reasons:
    1. Narrowing down a query before you make it is often **extremely important for performance reasons** (SQL queries are expensive)
    2. At the same time, the flexibility of aggregator functions is indispensible.
    3. Therefore, having both options: one that runs before the query (to filter data) and one that runs after (to aggregate and shape it) is ideal.

Run through a simple example for `WHERE`, then one for `HAVING`, then both:

```rb
# HAVING

def populous_continents
  # List the continents that have a total population of at least 100 million.
  execute(<<-SQL)
    SELECT
      continent
    FROM
      countries
    GROUP BY
      continent
    HAVING
      SUM(population) > 100000000;
  SQL
end

# WHERE

def per_capita_gdp
  # Show the name and per capita gdp (gdp/population) for each country where
  # the area is over 5,000,000 km^2
  execute(<<-SQL)
    SELECT
      name,
      gdp/population AS gdp
    FROM
      countries
    WHERE
      area > 5000000;
  SQL
end
```

```rb
def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    SELECT
      movies.yr,
      COUNT(*)
    FROM
      movies
    JOIN
      castings ON castings.movie_id = movies.id
    JOIN
      actors ON actors.id = castings.actor_id
    WHERE
      actors.name = 'John Travolta'
    GROUP BY
      movies.yr
    HAVING
      COUNT(*) >= 2;
  SQL
end
```