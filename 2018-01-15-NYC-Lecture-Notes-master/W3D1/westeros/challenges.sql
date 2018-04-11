CHALLENGE:
  "Select the id of Daenerys Targaryen"

SOLUTION:

SELECT
  characters.id
FROM
  characters
WHERE
  fname = 'Daenerys' AND lname = 'Targaryen';

CHALLENGE:
  "Select all of Daenerys Targaryen's pets using her id."

SOLUTION:

SELECT
  *
FROM
  pets
WHERE
  pets.owner_id = 25;

SELECT
  *
FROM
  pets
WHERE
  pets.owner_id = (
    SELECT
      characters.id
    FROM
      characters
    WHERE
      fname = 'Daenerys' AND lname = 'Targaryen'
  );


SELECT
  pets.*
FROM
  pets
JOIN
  characters
ON
  pets.owner_id = characters.id
WHERE
  characters.fname = 'Daenerys' AND characters.lname = 'Targaryen';

-- ================= MORE COMPLEX FILTERS ================

CHALLENGE:
  "Select the first names of the characters whose name"
  "starts with a T or an R, and only select three of them."

SOLUTION:

SELECT
  characters.fname
FROM
  characters
WHERE
  fname LIKE 'T%' OR fname LIKE 'R%'
-- Only return the first three results
LIMIT
  3;

-- ================= CASE ================

CHALLENGE:
  "Select all the characters names, give the Starks location as 'Winterfell',"
  "the Lannisters as 'Casterly Rock', the Baratheons as 'King's Landing'"
  "and everyone else as 'Other'."

SOLUTION:

SELECT
  characters.fname, characters.lname, (
    CASE
      characters.lname
    WHEN
      'Stark'
      THEN
      'Winterfell'
    WHEN
      'Lannister'
      THEN
      'King''s Landing'
    ELSE
      'Other'
    END
  )
FROM
  characters;

-- ================= COALESCE ================

CHALLENGE:
  "Select all the houses and their words. If the house does not have words,"
  "substitute something appropriate"

SOLUTION:

SELECT
  houses.name, COALESCE(houses.words, '🤡') AS words
FROM
  houses;

-- ================= SUB-QUERIES ================

CHALLENGE:
  "Select all of the Starks pets."

SOLUTION:



-- ================= JOINS ================

CHALLENGE:
  "Give me all the Starks' pets, this time using joins"

-- ================= GROUP BY AND AGGREGATE FUNCTIONS ================

SOLUTION:

CHALLENGE:
  "Select the number of Starks"

SOLUTION:

SELECT
  characters.lname, COUNT(characters.id)
FROM
  characters
WHERE
  characters.lname = 'Stark'
GROUP BY
  characters.lname;

CHALLENGE:
  "Select all the characters and the number of pets they have. Order by number"
  "of pets descending"

SOLUTION:

-- ================= HAVING ================

CHALLENGE:
  "Select the character with three pets"

SOLUTION:

CHALLENGE:
  "Select all the characters with 0 pets."

SOLUTION:

SELECT
  characters.*
FROM
  characters
LEFT JOIN
  pets
ON
  pets.owner_id = characters.id
WHERE
  pets.owner_id IS NULL;


CHALLENGE:
  "Find the houses that Theon Greyjoy belongs to, ordered by house name."

SOLUTION:

SELECT
  *
FROM
  houses
JOIN
  house_memberships
ON
  house_memberships.house_id = houses.id
JOIN
  characters
ON
  house_memberships.character_id = characters.id
WHERE
  characters.fname = 'Theon' AND characters.lname = 'Greyjoy'
ORDER BY
  houses.name DESC;















--end_of_doc
