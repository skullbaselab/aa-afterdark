-- all tas
SELECT
  *
FROM
  tas


-- all TAs with names starting with 'M'
SELECT
  *
FROM
  tas
WHERE
  name LIKE 'M%'

-- number of TAs per location_ids
SELECT
  location_id, COUNT(*) AS number_of_tas
FROM
  tas
GROUP BY
  location_id


-- number of TAs per location name
SELECT
  COUNT(*) AS num_tas,
  locations.name
FROM
  locations
JOIN
  tas
ON
  tas.location_id = locations.id
GROUP BY
  locations.name
ORDER BY
  num_tas DESC, locations.name
-- LIMIT
--   5
  --Ascending is the default

-- locations with only one TA
SELECT
  COUNT(*) AS num_tas,
  locations.name
FROM
  locations
JOIN
  tas
ON
  tas.location_id = locations.id
GROUP BY
  locations.name
HAVING
  COUNT(*) = 1


-- TAs and their tweets
SELECT
  *
FROM
  tas
LEFT OUTER JOIN
  tweets
ON
  tas.id = tweets.ta_id

-- only Tommy's tweets using subquery
SELECT
  *
FROM
  tweets
WHERE
  tweets.ta_id = (
    SELECT
      id
    FROM
      tas
    WHERE
      name = 'Tommy'
  )

-- only Tommy's tweets using JOIN
SELECT
  *
FROM
  tweets
JOIN
  tas
ON
  tas.id = tweets.ta_id
WHERE
  tas.name = 'Tommy'

-- tweets and their hashtags
SELECT
  tweets.body,
  hash_tags.name
FROM
  tweets
LEFT OUTER JOIN
  hash_taggings
ON
  hash_taggings.tweet_id = tweets.id
LEFT OUTER JOIN
  hash_tags
ON
  hash_tags.id = hash_taggings.hash_tag_id

-- All tas who don't have any tweets
SELECT
  tas.name
FROM
  tas
LEFT OUTER JOIN
  tweets
ON
  tas.id = tweets.ta_id
WHERE
  tweets.id IS NULL
--
SELECT
  tas.name, COUNT(tweets.id) AS tweets_count
FROM
 tas
JOIN
  tweets ON tas.id = tweets.ta_id
GROUP BY
  tas.name
