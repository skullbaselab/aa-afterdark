# Joins

![Joins Diagram](https://i.stack.imgur.com/VQ5XP.png)

* Basically they work this way:
    * **INNER JOIN** - Only the content with matches in both tables.
    * **LEFT JOIN** - Everything in the first table with all matches from the second table. Entries without matches in the second table are labelled `NULL`
    * **RIGHT JOIN** - Same as left join, but everything in the second table is included instead of everything in the first. Entries without matches once again labelled `NULL`
    * **FULL OUTER JOIN** - All records from both tables, regardless of match. Rows without matches have their empty columns again labelled `NULL`

Example of a join:

```sql
SELECT
  users.name, posts.title
FROM
  posts
JOIN
  users ON posts.user_id = users.id
```

### Joins Tables

```rb
def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    SELECT
      movies.title
    FROM
      movies
    JOIN
      castings ON castings.movie_id = movies.id
    JOIN
      actors ON actors.id = castings.actor_id
    WHERE
      actors.name = 'Harrison Ford';
  SQL
end
```

* Emphasize the many-to-many relationship.

Draw out a visual example of what the joins table looks like and what it's for:

| actor_id | movie_id |
|:--------:|:--------:|
|    1     |    3     |
|    1     |    7     |
|    3     |    5     |
|    2     |    5     |
|    4     |    5     |

Stress that it serves as a _middleman_ for the tables involved.
