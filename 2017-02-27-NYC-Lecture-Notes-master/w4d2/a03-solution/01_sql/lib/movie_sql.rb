require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie 'Rain Man'; order by the actors'
#    names.
def rain_man_cast
  MovieDatabase.execute(<<-SQL)
  SELECT
    actors.name
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    movies.title = 'Rain Man'
  ORDER BY
    actors.name
SQL
end

# 2. List the films in which 'Matt Damon' has appeared; order by
# movie title.
def matt_damon_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    actors.name = 'Matt Damon'
  ORDER BY
    movies.title
SQL
end

# 3. List the films in which 'Denzel Washington' has appeared, but not
#    in the leading role. Order by movie title.
def denzel_washington_non_starring_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    actors.name = 'Denzel Washington' AND ord != 1
  ORDER BY
    movies.title
SQL
end

# 4. List the films together with the leading star for all films
# produced in 1910. Order by movie title.
def leading_star_for_1910_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title, actors.name
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    (movies.yr = 1910 AND castings.ord = 1)
  ORDER BY
    movies.title
SQL
end

# 5. There is a movie from 1920 in our database for which there is no
#    associated casting information. Give the title of this movie.
def no_casting_info
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title
  FROM
    movies
  LEFT OUTER JOIN
    castings ON movies.id = castings.movie_id
  WHERE
    movies.yr = 1920 AND castings.movie_id IS NULL
  ORDER BY
    movies.title
SQL
end

# 6. Which films have more than 60 roles? List the movie title and
# number of roles. Order by movie title.
#
# Looks like most people that missed this one were grouping by movie
# title, not movie id. This will lead to two movies of the same name
# having their cast lists combined.
def big_movies
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title, COUNT(castings.movie_id) AS roles
  FROM
    castings
  JOIN
    movies ON castings.movie_id = movies.id
  GROUP BY
    castings.movie_id
  HAVING
    COUNT(castings.movie_id) > 60
  ORDER BY
    movies.title
SQL
end

# 7. List the film title and the leading actor for all of the films
# 'Julie Andrews' played in. Order by movie title name. Be careful!
# There is a movie (Pink Panther) in which Julie Andrews appears in
# two roles; do not double count the star of that film (Peter
# Sellers).
def julie_andrews_stars
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title, lead_actor.name
  FROM
    actors AS julie_actor
  JOIN
    castings AS julie_casting ON julie_actor.id = julie_casting.actor_id
  JOIN
    movies ON julie_casting.movie_id = movies.id
  JOIN
    castings AS lead_casting ON movies.id = lead_casting.movie_id
  JOIN
    actors AS lead_actor ON lead_casting.actor_id = lead_actor.id
  WHERE
    (julie_actor.name = "Julie Andrews" AND lead_casting.ord = 1)
  GROUP BY
    movies.id
  ORDER BY
    movies.title
SQL
end

# 8. There is a movie in which 'Barrie Ingham' plays two roles. Write a
# query that returns the title of this movie.
def barrie_ingham_multiple_roles
  MovieDatabase.execute(<<-SQL)
  SELECT DISTINCT
    movies.title
  FROM
    actors AS role1_actor
  JOIN
    castings AS role1_casting ON role1_actor.id = role1_casting.actor_id
  JOIN
    movies ON role1_casting.movie_id = movies.id
  JOIN
    castings AS role2_casting ON movies.id = role2_casting.movie_id
  JOIN
    actors AS role2_actor ON role2_casting.actor_id = role2_actor.id
  WHERE
    role1_actor.name = 'Barrie Ingham' AND
    role2_actor.name = 'Barrie Ingham' AND
      role1_casting.ord != role2_casting.ord
  /* Alternate solution. Uses two GROUP BY columns.
  SELECT
    movies.title
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    actors.name = 'Barrie Ingham'
  GROUP BY -- group rows where both movie_id & actor_id are the same:
    castings.movie_id, castings.actor_id
  HAVING
    COUNT(*) = 2
  */
SQL
end
