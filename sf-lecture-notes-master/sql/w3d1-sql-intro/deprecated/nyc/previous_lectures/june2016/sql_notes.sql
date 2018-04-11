-- General SQL query gotchas:
-- -use single quotes, not double quotes!
-- -limit has to be last
-- -order by has to come after where
-- -can't check equality with Null! use IS NOT NULL or IS NULL.
-- in Ruby, = is an assignment operator. in SQL, it checks equality.
  -- (ie, don't use == in SQL)




-- WHERE FILTERS
=, !=
  -- but can't check equality with Null!
LIKE
  -- eg fname LIKE 'Rob%'
BETWEEN
IN
  -- eg lname IN ('Greyjoy', 'Lannister')
IS NULL
IS NOT NULL




CHALLENGE:
  Give me the first names of the characters whose name
  starts with a T or an R, and I only want three of them.

SOLUTION:
  SELECT
    fname AS name
  FROM
    characters AS people
  WHERE
    people.fname LIKE 'T%' OR people.fname LIKE 'R%'
  ORDER BY
    people.fname DESC
  LIMIT
    3;




-- CUSTOMIZE QUERY
ORDER BY
  fname DESC
LIMIT
  10
AS

CASE
  WHEN (condition) THEN 'something'
  WHEN (condition) THEN 'other thing'
  ELSE 'default'
END

-- example: sort the starks, lannisters, and others by good guys tatus
SELECT
  fname,
  CASE
    WHEN lname = 'Stark' THEN 'good guys!'
    WHEN lname = 'Lannister' THEN 'we have complicated feelings'
    ELSE 'The Others'
  END AS goodness
FROM
  characters;

COALESCE
-- provides a default val for when column is NULL.
-- under the hood, uses if/else logic based on Null

-- example: get all the pets, and give the owner-less pet an owner id of 100.
SELECT
  name, COALESCE(owner_id, 100)
FROM
  pets;



-- GROUP BY, HAVING, AGGREGATE FUNCTIONS

-- group by: squashes down results into one row per unique item in
  -- the column that you tell it to squash on.

-- primary key: unique integer assigned to a row
-- when you are COUNTing, doing aggregates etc, good to use Primary Keys because:
  -- 1) they're unique (one per row)
  -- 2) they can't be null.

-- WHERE comes before GROUP BY (filters individual rows)
-- HAVING comes after GROUP BY (filters group as whole)

-- example: find the count of characters with a given last name, but only for
  -- the characters whose id is greater than 4.
SELECT
  lname, COUNT(id)
FROM
  characters
WHERE
  id > 4
GROUP BY
  lname
HAVING
  lname LIKE 'S%';







-- SUBQUERIES
-- using the results of one query in another query.

-- example: find all the pets who belong to owners with the last name Stark.
  -- spoiler alert: if these pets really belonged to Starks they might not be around too long.
SELECT
  *
FROM
  pets
WHERE
  owner_id IN (
    SELECT
      id
    FROM
      characters
    WHERE
      lname = 'Stark'
  );





-- JOINS
--  default is INNER JOIN. finds joins where both sides of join condition are not null.
--  remember you can specify LEFT OUTER JOIN if you want to allow null values in one side


-- example: give me a table of characters and their pets.
  -- include the info for characters who have no pets.
SELECT
  characters.fname, characters.lname, pets.name
FROM
  characters
LEFT OUTER JOIN
  pets
ON
  characters.id = pets.owner_id;


-- joins create a mega table that you can then filter down from.
-- make sure your aliases make semantic sense (ie, not single letters)
-- 'ON' specifies how you connect tables in a join. not for filtering results (that's WHERE)


CHALLENGE!:
  Find the houses that Theon Greyjoy belongs to, ordered by house name.

SOLUTION:
  SELECT
    *
  FROM
    houses AS h
  INNER JOIN
    house_memberships AS hm
  ON
    h.id = hm.house_id
  INNER JOIN
    characters AS c
  ON
    c.id = hm.character_id
  WHERE
    fname = 'Theon'
  ORDER BY
    h.name;












--
