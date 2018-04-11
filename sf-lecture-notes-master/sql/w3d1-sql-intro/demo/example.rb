require 'pg'
require 'byebug'

def execute(sql)
  conn = PG::Connection.open(:dbname => 'sqlzoo')
  query_result = conn.exec(sql).values
  conn.close

  query_result
end

# Get the name & area of the eleventh through fifteenth largest countries:

def example_one
  result = execute(<<-SQL)
    SELECT
      name, area
    FROM
      countries
    ORDER BY
      area DESC
    LIMIT
      5
    OFFSET
      10
  SQL

  debugger
  result
end

p example_one


def country_counts
  # For each continent show the continent and number of countries.
  execute(<<-SQL)
    SELECT
      continent,
      COUNT(*)
    FROM
      countries
    GROUP BY
      continent;
  SQL
end

def populous_country_counts
  # For each continent show the continent and number of countries with
  # populations of at least 10 million.
  execute(<<-SQL)
    SELECT
      continent,
      COUNT(*)
    FROM
      countries
    WHERE
      population >= 10000000
    GROUP BY
      continent;
  SQL
end

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
