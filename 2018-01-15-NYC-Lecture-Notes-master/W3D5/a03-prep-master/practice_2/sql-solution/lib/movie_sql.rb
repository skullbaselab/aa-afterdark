require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + '/../movie.db')

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie "Days of Being Wild"; order by the
# actors' name.
def days_of_being_wild_cast
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
      movies.title = 'Days of Being Wild'
    ORDER BY
      actors.name
  SQL
end

# 2. List the films 'Tsui Hark' has directed; order by
# movie title.
def tsui_hark_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title
    FROM
      actors
    JOIN
      movies ON actors.id = movies.director
    WHERE
      actors.name = 'Tsui Hark'
    ORDER BY
      movies.title
  SQL
end

# 3. List the films where actors with a last name
# of 'Kent' have appeared, but not in the star role.
# List the movie title and the actor name. Order by movie title.
# Note: The last name must exactly be 'Kent'. Hyphenated lasted names
# (e.g. 'Mary-Kent') should not count.
def kent_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
    SELECT DISTINCT
      movies.title, actors.name
    FROM
      actors
    JOIN
      castings ON actors.id = castings.actor_id
    JOIN
      movies ON castings.movie_id = movies.id
    WHERE
      (actors.name LIKE '% Kent' AND castings.ord != 1)
    ORDER BY
      movies.title
  SQL
end

# 4. List the films together with the leading star for all 1943
# films. Order by the actor's name.
def leading_star_for_1943_films
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
      (movies.yr = 1943 AND castings.ord = 1)
    ORDER BY
      actors.name
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

# 6. Obtain a list in alphabetical order of actors who've had >=26
# starring roles. Order by actor name.
def biggest_stars
  MovieDatabase.execute(<<-SQL)
    SELECT
      actors.name, COUNT(*) AS count
    FROM
      actors
    JOIN
      castings ON actors.id = castings.actor_id
    JOIN
      movies ON castings.movie_id = movies.id
    WHERE
      castings.ord = 1
    GROUP BY
      actors.id
    HAVING
      COUNT(*) >= 26
    ORDER BY
      actors.name
  SQL
end

# 7. List the movie year, movie title, and supporting actor (ord = 2)
# for all of the films in which Will Smith played the star role
# (ord = 1). Order by the name of the supporting actors.
def will_smith_supporting_actors
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.yr, movies.title, actors.name
    FROM
      actors
    JOIN
      castings ON actors.id = castings.actor_id
    JOIN
      movies ON castings.movie_id = movies.id
    WHERE
      castings.ord = 2 AND movies.id IN
      (
        SELECT
          movie_id
        FROM
          castings
        JOIN
          actors ON castings.actor_id = actors.id
        WHERE
          actors.name = 'Will Smith' AND castings.ord = 1
      )
    ORDER BY
      actors.name
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
      movies ON castings.movie_id = movie.id
    WHERE
      actors.name = 'Barrie Ingham'
    GROUP BY -- group rows where both movie_id & actor_id are the same:
      castings.movie_id, castings.actor_id
    HAVING
      COUNT(*) = 2
    */
  SQL
end
