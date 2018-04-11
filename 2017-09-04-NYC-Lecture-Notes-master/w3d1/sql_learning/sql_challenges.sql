CHALLENGE:
  "Select the id of Daenerys Targaryen"

SOLUTION:
  SELECT
    id
  FROM
    characters
  WHERE
    lname = 'Targaryen' AND
    fname = 'Daenerys';
    -- Single quotes important here!

CHALLENGE:
  "Select all of Daenerys Targaryen's pets using her id."

SOLUTION:
  SELECT
    *
  FROM
    pets
  WHERE
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
    fname LIKE 'T%' OR
    fname LIKE 'Robb%'
  LIMIT
    3;

-- ================= CASE ================

CHALLENGE:
  "Select all the characters names, give the Starks location as 'Winterfell',"
  "the Lannisters as 'Casterly Rock', the Baratheons as 'King's Landing'"
  "and everyone else as 'Other'."

SOLUTION:
  SELECT
    fname, lname, (
      CASE lname
      WHEN 'Stark'
      THEN 'Winterfell'
      WHEN 'Lannister'
      THEN 'Casterly Rock'
      WHEN 'Baratheon'
      THEN 'King''s Landing'
      ELSE 'Other'
      END
    ) AS location
  FROM
    characters;



-- ================= COALESCE ================

CHALLENGE:
  "Select all the houses and their words. If the house does not have words,"
  "substitute something appropriate"

SOLUTION:
  SELECT
    name, COALESCE(words, '😍') AS words
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
        lname = 'Stark' OR (fname = 'Jon' AND lname = 'Snow')
    );




-- ================= JOINS ================

CHALLENGE:
  "Give me all the Starks' pets, this time using joins"

SOLUTION:

  SELECT
    pets.*
  FROM
    pets
  JOIN
    characters ON pets.owner_id = characters.id
  WHERE
    characters.lname = 'Stark' OR (
      characters.fname = 'Jon' AND characters.lname = 'Snow'
    );

CHALLENGE:
  "Select all the characters and the number of pets they have. Order by number"
  "of pets descending"

  SELECT
    fname, COUNT(pets.id) AS number_of_pets
  FROM
    characters
  LEFT OUTER JOIN
    pets ON pets.owner_id = characters.id
  GROUP BY
    characters.id
  ORDER BY
    number_of_pets DESC;

SOLUTION:

CHALLENGE:
  "Select the character with three pets"

SOLUTION:
  SELECT
    fname, COUNT(pets.id) AS number_of_pets
  FROM
    characters
  LEFT OUTER JOIN
    pets ON pets.owner_id = characters.id
  GROUP BY
    characters.id
  HAVING
    COUNT(pets.id) = 3;

CHALLENGE:
  "Select all the characters with 0 pets."

SOLUTION:
  SELECT
    fname
  FROM
    characters
  LEFT OUTER JOIN
    pets ON pets.owner_id = characters.id
  WHERE
    pets.id IS NULL;
    -- Can't put '= NULL' here!


CHALLENGE:
  "Find the houses that Theon Greyjoy belongs to, ordered by house name."

SOLUTION:
  SELECT
    name
  FROM
    houses
  JOIN
    house_memberships ON houses.id = house_memberships.house_id
  JOIN
    characters ON characters.id = house_memberships.character_id
  WHERE
    characters.fname = 'Theon' AND characters.lname = 'Greyjoy'
  ORDER BY
    name;
