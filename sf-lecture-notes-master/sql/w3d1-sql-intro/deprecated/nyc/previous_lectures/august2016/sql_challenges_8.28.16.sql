-- ================= SIMPLE QUERIES ================

CHALLENGE:
  "Select the id of Daenerys Targaryen"

SOLUTION:
  SELECT
    id
  FROM
    characters
  WHERE
    fname = 'Daenerys' -- Today we can drop semicolons in Atom
    -- REMEMBER TO USE SINGLE QUOTES

CHALLENGE:
  "Select all of Daenerys Targaryen's pets using her id."

SOLUTION:
  SELECT -- This is just the columns we want to return
    id, name
  FROM -- Consider this first
    pets
  WHERE -- Then this stuff - filters, joins, etc
    owner_id = 25;


-- ================= MORE COMPLEX FILTERS ================

CHALLENGE:
  "Select the first names of the characters whose name"
  "starts with a T or an R, and only select three of them."

SOLUTION:
  SELECT
    fname
  FROM
    characters
  WHERE
    fname LIKE 'T%' OR fname 'R%'
  LIMIT -- ORDER MATTERS - LIMIT GOES AT THE END
    3;
-- ================= CASE ================

CHALLENGE:
  "Select all the characters names, give the starks location as 'Winterfell',"
  "the Lannisters as 'Casterly Rock', the Baratheons as 'King's Landing'"
  "and everyone else as 'Other'."

SOLUTION:
  SELECT
    fname,
    lname,
    CASE
      WHEN lname = 'Stark' THEN 'Winterfell'
      WHEN lname = 'Lannister' THEN 'Casterly Rock'
      WHEN lname = 'Baratheon' THEN 'King''s Landing' -- Use two single quotes to escape a '
      ELSE 'Other'
    END AS location
  FROM
    characters;
-- ================= COALESCE ================

CHALLENGE:
  "Select all the houses and their words. If the house does not have words,"
  "substitute something appropriate"

SOLUTION:
  SELECT
    name, sigil, COALESCE(words, 'Use the Debugger') AS words
  FROM
    houses;
-- ================= SUB-QUERIES ================

CHALLENGE:
  "Select all of the Starks pets."

SOLUTION:
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
-- ================= JOINS ================

CHALLENGE:
  "Give me all the starks pets, this time using joins"

SOLUTION:
  SELECT
    *
  FROM
    characters
  JOIN -- INNER JOIN
    pets ON characters.id = pets.owner_id
  WHERE
    characters.lname = 'Stark';
CHALLENGE:
  "Select all the characters and the number of pets they have."

SOLUTION:
  SELECT --
    characters.*, COUNT(pets.id) AS num_pets
  FROM
    characters
  LEFT OUTER JOIN
    pets ON pets.owner_id = characters.id
  GROUP BY -- would go after a WHERE clause
    characters.id
  ORDER BY
    num_pets DESC;
CHALLENGE:
  "Select all the characters with 0 pets."

SOLUTION:
  SELECT
    characters.fname, characters.lname
  FROM
    characters
  LEFT OUTER JOIN
    pets ON characters.id = pets.owner_id
  WHERE
    pets.id IS NULL;

CHALLENGE!:
  "Find the houses that Theon Greyjoy belongs to, ordered by house name."

SOLUTION:
  SELECT
    houses.name
  FROM
    houses
  JOIN
    house_memberships ON house_memberships.house_id = houses.id
  JOIN
    characters ON house_memberships.character_id = characters.id
  WHERE
    characters.fname = 'Theon';
