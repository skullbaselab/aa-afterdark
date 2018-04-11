-- ================= SINGLE TABLE =================

CHALLENGE: "Select the entire pets table."

SOLUTION:
  SELECT
    *
  FROM
    pets;

CHALLENGE: "Select the id of Daenerys Targaryen."
SOLUTION:
  SELECT
    id
  FROM
    characters
  WHERE
    fname = 'Daenerys' AND lname = 'Targaryen'


CHALLENGE: "Select all of Daenerys Targaryen's pets using her id."
SOLUTION:
  SELECT
    name
  FROM
    pets
  WHERE
    owner_id = 25;

CHALLENGE: "Select the houses' name who's 'sigil' is a 'Cat-Hamster'."
SOLUTION:
  SELECT
    name
  FROM
    houses
  WHERE
    sigil = 'Cat-Hamster';

CHALLENGE:
  "Select the houses who's words are 'Winter is Coming',
  or their sigil is a 'Lion'."
SOLUTION:
  SELECT
    name
  FROM
    houses
  WHERE
    sigil = 'Lion' OR words = 'Winter is Coming';

-- ================= ADDING COMPLEXITY ================

CHALLENGE:
  "Select the first names of the characters whose name
  starts with a T or an R, and only select three of them."
SOLUTION:
  SELECT
    fname
  FROM
    characters
  WHERE
    fname LIKE 'T%' OR fname LIKE 'R%'
  LIMIT
    3;

CHALLENGE: "Select the name of the house who's words first word is 'As'."
SOLUTION:
  SELECT
    name
  FROM
    houses
  WHERE
    words LIKE 'As%';

CHALLENGE: "Select the name of the house who's words include the word 'High'."
SOLUTION:
  SELECT
    name
  FROM
    houses
  WHERE
    words LIKE '%High%';


-- ================= CASE ================

CHALLENGE:
  "Select all the characters names, give the Starks location as 'Winterfell',"
  "the Lannisters as 'Casterly Rock', the Baratheons as 'King's Landing'"
  "and everyone else as 'Other'."
SOLUTION:
  SELECT
    fname, lname,
    CASE lname
    WHEN 'Stark' THEN 'Winterfell'
    WHEN 'Lannister' THEN 'Casterly Rock'
    WHEN 'Baratheon' THEN 'King''s Landing'
    ELSE 'Other'
    END AS location
  FROM
    characters;


-- ================= COALESCE ================

CHALLENGE:
  "Select all the houses and their words. If the house does not have words,
  substitute something appropriate"
SOLUTION:
  SELECT
    houses.name, COALESCE (words, 'something appropriate') AS words
  FROM
    houses;

-- ================= SUB-QUERIES ================

CHALLENGE:
  "Select all of the Starks pets (that includes Jon Snow...)"
SOLUTION:
  SELECT
    pets.name
  FROM
    pets
  WHERE
    pets.owner_id IN (
      SELECT
        characters.id
      FROM
        characters
      WHERE
        (fname = 'Jon' AND lname = 'Snow') OR
        lname = 'Stark'
    );

CHALLENGE:
  "Select the first names of characters who have pets."
SOLUTION:
  SELECT
    characters.fname
  FROM
    characters
  WHERE
    characters.id IN (
      SELECT
        pets.owner_id
      FROM
        pets
    );

-- ================= JOINS & AGGREGATES ================

CHALLENGE:
  "Give me all the Starks' pets, this time using joins."
SOLUTION:
  SELECT
    pets.name
  FROM
    pets
  INNER JOIN
    characters ON pets.owner_id = characters.id
  WHERE
    characters.lname = 'Stark' OR characters.lname = 'Snow';

CHALLENGE:
  "Select all the characters and the number of pets they have. Order by number"
  "of pets descending"
SOLUTION:
  SELECT
    characters.fname, COUNT(pets.owner_id) AS num_pets
  FROM
    characters
  LEFT OUTER JOIN
    pets ON pets.owner_id = characters.id
  GROUP BY
    characters.id
  ORDER BY
    num_pets DESC;

CHALLENGE:
  "Select the character with three pets"
SOLUTION:
  SELECT
    *
  FROM
    characters
  JOIN
    pets ON pets.owner_id = characters.id
  GROUP BY
    characters.id
  HAVING
    COUNT(characters.id) = 3;


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
    pets.owner_id IS NULL;

CHALLENGE:
  "Find the houses that Theon Greyjoy is a member of, ordered by house name."
SOLUTION:
  SELECT
    houses.name
  FROM
    houses
  JOIN
    house_memberships ON houses.id = house_memberships.house_id
  JOIN
    characters ON house_memberships.character_id = characters.id
  WHERE
    characters.fname = 'Theon' AND characters.lname = 'Greyjoy'
  ORDER BY
    houses.name;
