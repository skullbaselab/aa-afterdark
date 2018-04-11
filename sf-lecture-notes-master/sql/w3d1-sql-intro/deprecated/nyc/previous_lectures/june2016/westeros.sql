-- HOUSES

DROP TABLE IF EXISTS houses;
CREATE TABLE houses(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  sigil VARCHAR(255),
  words VARCHAR(255)
);

INSERT INTO
  houses (id, name, sigil, words)
VALUES
  (1, 'Stark', 'Direwolf', 'Winter is Coming'),
  (2, 'Lannister', 'Lion', 'Hear Me Roar'),
  (3, 'Baratheon', 'Stag', 'Ours is the Fury'),
  (4, 'Greyjoy', 'Kraken', 'We Do Not Sow'),
  (5, 'Arryn', 'Falcon', 'As High As Honor')

-- CHARACTERS

DROP TABLE IF EXISTS characters;
CREATE TABLE characters(
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

INSERT INTO
  characters (id, fname, lname)
VALUES
  (1, 'Eddard', 'Stark'),
  (2, 'Catelyn', 'Stark'),
  (3, 'Robb', 'Stark'),
  (4, 'Arya', 'Stark'),
  (5, 'Sansa', 'Stark'),
  (6, 'Brandon', 'Stark'),
  (7, 'Rickon', 'Stark'),
  (8, 'Jon', 'Snow'),
  (9, 'Theon', 'Greyjoy'),
  (10, 'Asha', 'Greyjoy'),
  (11, 'Balon', 'Greyjoy'),
  (12, 'Victarion', 'Greyjoy'),
  (13, 'Euron', 'Greyjoy'),
  (14, 'Tywin', 'Lannister'),
  (15, 'Tyrion', 'Lannister'),
  (16, 'Jaime', 'Lannister'),
  (17, 'Cersei', 'Lannister'),
  (18, 'Robert', 'Baratheon'),
  (19, 'Joffrey', 'Baratheon'),
  (20, 'Tommen', 'Baratheon'),
  (21, 'Myrcella', 'Baratheon'),
  (22, 'Stannis', 'Baratheon'),
  (23, 'Shireen', 'Baratheon'),
  (24, 'Renly', 'Baratheon'),
  (25, 'Jon', 'Arryn');


-- PETS

DROP TABLE IF EXISTS pets;
CREATE TABLE pets(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER,
  FOREIGN KEY (owner_id) REFERENCES characters(id)
);

INSERT INTO
  pets (id, name, owner_id)
VALUES
  (1, 'Sennacy', 1),
  (2, 'Paprika', 1),
  (3, 'Luna', 2),
  (4, 'Bramble', 8),
  (5, 'Ella', 8),
  (6, 'Dori', 14),
  (7, 'Nemo', NULL);



-- HOUSE MEMBERSHIPS

DROP TABLE IF EXISTS house_memberships;
CREATE TABLE house_memberships(
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
