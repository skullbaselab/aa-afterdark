DROP TABLE IF EXISTS app_academy;
CREATE TABLE app_academy (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  pod_leader_id INTEGER
);

\! ECHO "Created App Academy Table"

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (1, 'Isak', NULL);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (2, 'Anastassia', 1);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (3, 'Jesse', 1);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (4, 'Aaron', NULL);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (5, 'Tommy', 4);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (6, 'Andres', 4);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (7, 'AJ', NULL);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (8, 'Cynthia', 7);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (9, 'David', 7);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (10, 'Kush', NULL);

INSERT INTO
  app_academy (id, name, pod_leader_id)
VALUES
  (11, 'Ned', NULL);


DROP TABLE IF EXISTS hack_reactor;
CREATE TABLE hack_reactor (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

\! ECHO "Created Hack Reactor Table"

INSERT INTO
  hack_reactor (id, name)
VALUES
  (1, 'Joe');

INSERT INTO
  hack_reactor (id, name)
VALUES
  (2, 'Jane');

INSERT INTO
  hack_reactor (id, name)
VALUES
  (3, 'John');

-- Many-Many relationshpi between app_academy and hack_reactor

DROP TABLE IF EXISTS friendships;
CREATE TABLE friendships (
  aa_id INTEGER NOT NULL,
  hr_id INTEGER NOT NULL
);

\! ECHO "Created Friendships Table"


INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (1, 1);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (1, 2);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (1, 3);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (2, 3);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (3, 1);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (3, 2);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (2, 2);

-- One-to-Many relationship between app_academy people and possessions

DROP TABLE IF EXISTS possessions;
CREATE TABLE possessions (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255),
  cost INTEGER,
  owner_id INTEGER
);

\! ECHO "Created Possessions Table"

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (1, 'laptop', 1050, 'tech', 1);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (2, 'laptop', 900, 'tech', 2);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (3, 'laptop', 1100, 'tech', 3);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (4, 'mug', 10, 'home', 4);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (5, 'mug', 5, 'home', 1);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (6, 'phone', 100, 'tech', 2);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (7, 'car', 10000, 'tech', 3);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (8, 'headphones', 40, 'tech', 1);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (9, 'headphones', 30, 'tech', 8);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (10, 'mug', 3, 'home', 8);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (11, 'laptop', 800, 'tech', 8);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (12, 'standing desk', 200, 'home', 11);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (13, 'black jacket', 60, 'attire', 10);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (14, 'shoes', 50, 'attire', 3);

INSERT INTO
  possessions (id, name, cost, type, owner_id)
VALUES
  (15, 'more shoes', 50, 'attire', 3);
