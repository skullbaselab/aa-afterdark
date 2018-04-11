DROP TABLE IF EXISTS houses CASCADE;
CREATE TABLE houses(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  sigil VARCHAR(255),
  words VARCHAR(255)
);

INSERT INTO
  houses (name, sigil, words)
VALUES
  ('Stark', 'Direwolf', 'Winter is Coming'),
  ('Lannister', 'Lion', 'Hear Me Roar'),
  ('Baratheon', 'Stag', 'Ours is the Fury'),
  ('Greyjoy', 'Kraken', 'We Do Not Sow'),
  ('Arryn', 'Falcon', 'As High As Honor'),
  ('Targaryen', 'Dragon', 'Fire and Blood'),
  ('App Academy', 'Sennacy', NULL);

-- CHARACTERS

DROP TABLE IF EXISTS characters CASCADE;
CREATE TABLE characters(
  id SERIAL PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

INSERT INTO
  characters (fname, lname)
VALUES
  ('Eddard', 'Stark'),
  ('Catelyn', 'Stark'),
  ('Robb', 'Stark'),
  ('Arya', 'Stark'),
  ('Sansa', 'Stark'),
  ('Brandon', 'Stark'),
  ('Rickon', 'Stark'),
  ('Jon', 'Snow'),
  ('Theon', 'Greyjoy'),
  ('Asha', 'Greyjoy'),
  ('Balon', 'Greyjoy'),
  ('Victarion', 'Greyjoy'),
  ('Euron', 'Greyjoy'),
  ('Tywin', 'Lannister'),
  ('Tyrion', 'Lannister'),
  ('Jaime', 'Lannister'),
  ('Cersei', 'Lannister'),
  ('Robert', 'Baratheon'),
  ('Joffrey', 'Baratheon'),
  ('Tommen', 'Baratheon'),
  ('Myrcella', 'Baratheon'),
  ('Stannis', 'Baratheon'),
  ('Shireen', 'Baratheon'),
  ('Renly', 'Baratheon'),
  ('Daenerys', 'Targaryen'),
  ('Viserys', 'Targaryen'),
  ('Rhaegar', 'Targaryen'),
  ('Jon', 'Arryn');


-- PETS

DROP TABLE IF EXISTS pets CASCADE;
CREATE TABLE pets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER,
  FOREIGN KEY (owner_id) REFERENCES characters(id)
);

INSERT INTO
  pets (name, owner_id)
VALUES
  ('Drogon', (SELECT id FROM characters WHERE fname = 'Daenerys')),
  ('Rhaegal', (SELECT id FROM characters WHERE fname = 'Daenerys')),
  ('Viserion', (SELECT id FROM characters WHERE fname = 'Daenerys')),
  ('Summer', (SELECT id FROM characters WHERE fname = 'Brandon')),
  ('Shaggydog', (SELECT id FROM characters WHERE fname = 'Rickon')),
  ('Ghost', (SELECT id FROM characters WHERE lname = 'Snow')),
  ('Nymeria', (SELECT id FROM characters WHERE fname = 'Arya')),
  ('Grey Wind', (SELECT id FROM characters WHERE fname = 'Robb')),
  ('Lady', (SELECT id FROM characters WHERE fname = 'Sansa'));



-- HOUSE MEMBERSHIPS

DROP TABLE IF EXISTS house_memberships CASCADE;
CREATE TABLE house_memberships(
  id SERIAL PRIMARY KEY,
  character_id INTEGER NOT NULL,
  house_id INTEGER NOT NULL,

  FOREIGN KEY (character_id) REFERENCES characters(id),
  FOREIGN KEY (house_id) REFERENCES houses(id)
);

INSERT INTO
  house_memberships (character_id, house_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 1),
  (6, 1),
  (7, 1),
  (8, 1),
  (8, 6),
  (9, 1),
  (9, 4),
  (10, 4),
  (11, 4),
  (12, 4),
  (13, 4),
  (14, 2),
  (15, 2),
  (16, 2),
  (17, 2),
  (18, 3),
  (19, 2),
  (19, 3),
  (20, 2),
  (20, 3),
  (21, 2),
  (21, 3),
  (22, 3),
  (23, 3),
  (24, 3),
  (25, 5);
