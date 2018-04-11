// all_tas
SELECT
  *
FROM
  tas

// all_tas_with_M_names
SELECT
  *
FROM
  tas
WHERE
  tas.name LIKE 'M%'

// count_number_of_tas_per_location_id
SELECT
  tas.location_id, COUNT(tas.id) AS num_tas
FROM
  tas
GROUP BY
  tas.location_id
ORDER BY
  DESC COUNT(tas.id)

// count_number_of_tas_per_location_name
SELECT
  locations.name, COUNT(tas.id)
FROM
  tas
JOIN
  locations ON locations.id = tas.location_id
GROUP BY
  locations.name

// locations_with_only_one_ta
SELECT
  locations.name, COUNT(tas.id)
FROM
  tas
JOIN
  locations ON locations.id = tas.location_id
GROUP BY
  locations.name
HAVING
  COUNT(tas.id) = 1

// tas_and_their_tweets
SELECT
  tas.name, tweets.body
FROM
  tas
JOIN
  tweets
ON
  tweets.ta_id = tas.id

// tommys_tweets
SELECT
  *
FROM
  tweets
WHERE
  tweets.ta_id IN (
  SELECT
    id
  FROM
    tas
  WHERE
    name = 'Tommy'
)

// tweets_and_hashtags
SELECT
  *
FROM
  tweets
JOIN
  hash_taggings ON hash_taggings.tweet_id = tweets.id
JOIN
  hash_tags ON hash_tags.id = hash_taggings.hash_tag_id
