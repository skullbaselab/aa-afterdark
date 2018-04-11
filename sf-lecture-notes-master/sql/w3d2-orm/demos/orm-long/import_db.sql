DROP TABLE IF EXISTS people;

CREATE TABLE people (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INTEGER NOT NULL,
  house_id INTEGER NOT NULL,

  FOREIGN KEY (house_id) REFERENCES houses (id)
);

DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  words VARCHAR(255) NOT NULL
);

INSERT INTO
  houses (name, words)
VALUES
  ('Stark', 'Winter is coming'),
  ('Greyjoy', 'We do now sow'),
  ('Baratheon', 'Ours is the fury'),
  ('Tyrell', 'Growing strong'),
  ('Lannister', 'Hear me roar!');

INSERT INTO
  people (name, age, house_id)
VALUES
  ('Ned', 36, (SELECT id FROM houses WHERE name = 'Stark')),
  ('Theon/Reek', 23, (SELECT id FROM houses WHERE name = 'Greyjoy')),
  ('Stannis', 35, (SELECT id FROM houses WHERE name = 'Baratheon'));
