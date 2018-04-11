DROP TABLE IF EXISTS food;
CREATE TABLE food (
  id INTEGER PRIMARY KEY,
  foodtype VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  calories INTEGER NOT NULL
);

--USE SINGLE QUOTES INSTEAD OF DOUBLE!

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (1, 'vegetable', 'carrot', 25);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (2, 'vegetable', 'beet', 59);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (3, 'vegetable', 'cucumber', 8);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (4, 'fruit', 'apple', 95);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (5, 'fruit', 'banana', 105);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (6, 'fruit', 'strawberry', 4);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (7, 'grain', 'bread', 100);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (8, 'grain', 'oatmeal', 160);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (9, 'processed', 'burger', 500);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (10, 'processed', 'fries', 400);


DROP TABLE IF EXISTS food_log;
CREATE TABLE food_log (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  food_id INTEGER NOT NULL
);

INSERT INTO
  food_log (id, fname, lname, food_id)
VALUES
  (1, 'Kush', 'Patel', 8);

INSERT INTO
  food_log (id, fname, lname, food_id)
VALUES
  (2, 'Ned', 'Ruggeri', 5);

INSERT INTO
  food_log (id, fname, lname, food_id)
VALUES
  (3, 'Hasseb', 'Qureshi', 2);

INSERT INTO
  food_log (id, fname, lname, food_id)
VALUES
  (4, 'Kush', 'Patel', 9);

INSERT INTO
  food_log (id, fname, lname, food_id)
VALUES
  (5, 'Kush', 'Patel', 4);

INSERT INTO
  food_log (id, fname, lname, food_id)
VALUES
  (6, 'Ned', 'Ruggeri', 10);
