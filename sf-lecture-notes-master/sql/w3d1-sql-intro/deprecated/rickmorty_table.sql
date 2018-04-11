DROP TABLE IF EXISTS rickmorty;
CREATE TABLE rickmorty (
  id INTEGER PRIMARY KEY,
  rick VARCHAR(255),
  morty VARCHAR(255)
);


INSERT INTO
  rickmorty (id, rick, morty)
VALUES
  (1, 'rick', 'morty');

INSERT INTO
  rickmorty (id, rick, morty)
VALUES
  (2, 'pickle_rick', 'morty');

INSERT INTO
  rickmorty (id, rick, morty)
VALUES
  (3, 'evil_rick', NULL);

INSERT INTO
  rickmorty (id, rick, morty)
VALUES
  (4, 'rick', 'pocket_morty');

INSERT INTO
  rickmorty (id, rick, morty)
VALUES
  (5, 'rick', 'morty');
