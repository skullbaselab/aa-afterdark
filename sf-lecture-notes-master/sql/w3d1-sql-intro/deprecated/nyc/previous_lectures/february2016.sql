###############---SQL---#############

-- Select all columns from houses
SELECT
  *
FROM
  houses;


-- Select only the words column from houses
SELECT
  words -- selected columns
FROM
  houses; -- table to select from


-- Select character last names
SELECT
  lname
FROM
  characters;

-- Select distinct character last names
SELECT DISTINCT
  lname
FROM
  characters;

-- Select all columns from characters where the last name is "Stark"
SELECT
  *
FROM
  characters
WHERE
  lname = 'Stark'; -- single quotes, important!

-- Select all columns from characters where the last name is "Stark" ordered by first name.
SELECT
  *
FROM
  characters
WHERE
  lname = 'Stark' -- single quotes, important!
ORDER BY
  fname ASC -- explicit ascending not needed, just for clarity.
LIMIT
  5;

-- Select all characters who's first name contains "Rob"
SELECT
  *
FROM
  characters
WHERE
  fname LIKE '%Rob%';

-- Select all characters who's last name matches all characters who have a first name like "Rob"
SELECT
  *
FROM
  characters
WHERE
  lname IN (
    SELECT
      lname
    FROM
      characters
    WHERE
      fname LIKE '%Rob%'
  );


-- Example of setting a subquery to an alias so it can be reused.
SELECT
  *
FROM
  (
    SELECT
      *
    FROM
      characters
    WHERE
      lname = 'Stark'
  ) AS starks -- set subquery to a table called "starks" which we can reference later
WHERE
  starks.id > 3;


-- select all the characters that are in houses 'Stark' or 'Greyjoy'
SELECT
  characters.*
FROM
  characters
JOIN
  house_memberships
ON
  house_memberships.character_id = characters.id
  -- characters.id = house_memberships.character_id --  also fine
JOIN
  houses
ON
  house_memberships.house_id = houses.id
WHERE
  houses.name = 'Stark' OR houses.name = 'Greyjoy';

-- Select a count of number of characters in selected houses.
SELECT
  houses.*, COUNT(characters.id)
FROM
  characters
JOIN
  house_memberships
ON
  house_memberships.character_id = characters.id
  -- characters.id = house_memberships.character_id --  also fine
JOIN
  houses
ON
  house_memberships.house_id = houses.id
WHERE
  houses.name = 'Stark' OR houses.name = 'Greyjoy'
GROUP BY
  houses.id;

-- Refactored version
SELECT
  houses.*, COUNT(house_memberships.id)
FROM
  houses
JOIN
  house_memberships
ON
  house_memberships.house_id = houses.id
WHERE
  houses.name = 'Stark' OR houses.name = 'Greyjoy'
GROUP BY
  houses.id;

-- Select all houses, regardless of whether they have any members.
SELECT
  houses.*, COUNT(house_memberships.id) as num_members
FROM
  houses
LEFT OUTER JOIN -- Keep all houses in this, no matter wat
  house_memberships
ON
  house_memberships.house_id = houses.id
GROUP BY
  houses.id
HAVING
  COUNT(house_memberships.id);

-- Select all characters without a last name, and display their lname as "Snow"
SELECT
  fname, COALESCE(lname, 'Snow') AS lname
FROM
  characters
WHERE
  -- lname = NULL; -- BAAD, nothing equals null.
  lname IS NULL;


-- Select all characters and include a faction column with the result of a case statement.
SELECT
  characters.*,
  CASE
  WHEN
    lname = 'Stark'
  THEN
    'Good'
  ELSE
    'Evil'
  END AS faction
FROM
  characters;
