DROP TABLE IF EXISTS shows CASCADE;
CREATE TABLE shows(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

INSERT INTO
  shows (name)
VALUES
  ('Game of Thrones'),
  ('Westworld');

DROP TABLE IF EXISTS tas;
CREATE TABLE tas(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  fav_show_id INTEGER,
  FOREIGN KEY (fav_show_id) REFERENCES shows(id)
);

INSERT INTO
  tas (name, fav_show_id)
VALUES
  ('Brian', 1),
  ('Matthias', 1),
  ('Abby', 1),
  ('Mashu', null);
