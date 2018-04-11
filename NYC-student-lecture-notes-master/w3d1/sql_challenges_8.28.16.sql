-- ================= SIMPLE QUERIES ================

CHALLENGE:
  "Select the id of Daenerys Targaryen"

SOLUTION:
  SELECT
    characters.id
  FROM
    characters
  WHERE
    characters.fname = 'Daenerys';

CHALLENGE:
  "Select all of Daenerys Targaryen's pets using her id."

SOLUTION:
  SELECT
    *
  FROM
    pets
  WHERE
    pets.owner_id = 25;

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
    fname LIKE 'T%' OR fname LIKE 'R%'
  LIMIT
    3;

-- ================= CASE ================

CHALLENGE:
  "Select all the characters names, give the Starks location as 'Winterfell',"
  "the Lannisters as 'Casterly Rock', the Baratheons as 'King's Landing'"
  "and everyone else as 'Other'."

SOLUTION:
  SELECT
    fname,
    lname,
    CASE
      WHEN lname = 'Stark' THEN 'Winterfell'
      WHEN lname = 'Lannister' THEN 'Casterly Rock'
      WHEN lname = 'Baratheon' THEN 'King''s Landing'
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
    name, COALESCE(words, '#EndlessCoffee') AS words
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
  "Give me all the Starks' pets, this time using joins"

SOLUTION:
  SELECT
    pets.name
  FROM
    characters
  JOIN
    pets ON characters.id = pets.owner_id
  WHERE
    characters.lname = 'Stark';

CHALLENGE:
  "Select all the characters and the number of pets they have. Order by number"
  "of pets descending"

SOLUTION:
  SELECT
    characters.fname, COUNT(pets.id) AS num_pets
  FROM
    characters
  LEFT OUTER JOIN
    pets ON characters.id = pets.owner_id
  GROUP BY
    characters.id
  ORDER BY
    COUNT(pets.id) DESC, characters.fname;

CHALLENGE:
  "Select the character with three pets"

SOLUTION:
  SELECT
    characters.fname, COUNT(pets.id) AS num_pets
  FROM
    characters
  LEFT OUTER JOIN
    pets ON characters.id = pets.owner_id
  GROUP BY
    characters.id
  HAVING
    COUNT(pets.id) = 3;

CHALLENGE:
  "Select all the characters with 0 pets."

SOLUTION:
  SELECT
    *
  FROM
    characters
  LEFT OUTER JOIN
    pets ON characters.id = pets.owner_id
  WHERE
    pets.id IS NULL;

CHALLENGE:
  "Find the houses that Theon Greyjoy belongs to, ordered by house name."

SOLUTION:
  SELECT
    houses.name
  FROM
    characters
  JOIN
    house_memberships ON characters.id = house_memberships.character_id
  JOIN
    houses ON houses.id = house_memberships.house_id
  WHERE
    characters.fname = 'Theon'
  ORDER BY
    houses.name;
