-- PostgreSQL database dump
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

-- CREATE TABLES
CREATE TABLE tas (
    id serial  NOT NULL,
    name VARCHAR(20)  NOT NULL,
    location_id integer
);

CREATE TABLE locations (
    id serial  NOT NULL,
    name VARCHAR(20)  NOT NULL
);

CREATE TABLE tweets (
    id serial  NOT NULL,
    ta_id integer  NOT NULL,
    body VARCHAR(50)  NOT NULL
);

CREATE TABLE hash_tags (
    id serial  NOT NULL, -- serial is short for integer primary key
    name VARCHAR(20)  NOT NULL
);

-- join table relating hash_tags and tweets
CREATE TABLE hash_taggings (
    id serial  NOT NULL,
    tweet_id integer  NOT NULL,
    hash_tag_id integer  NOT NULL
);

-- INSERT DATA
INSERT INTO locations (name)
VALUES
  ('Argentina'),
  ('Massachusetts'),
  ('California'),
  ('Pittsburgh'),
  ('New Jersey'),
  ('Florida'),
  ('Connecticut'),
  ('New York'),
  ('Mars');

INSERT INTO tas (name, location_id)
VALUES
  ('Tommy', 1),
  ('Daniel', 2),
  ('Fred', 2),
  ('Patrick', 3),
  ('Clayton', 3),
  ('Meagan', 3),
  ('Ali', 4),
  ('Maurice', 5),
  ('Mike', 5),
  ('Alex', 6),
  ('Tassos', 7),
  ('Danny', 8),
  ('Kurstie', 8),
  ('Oscar', 9);


INSERT INTO hash_tags (name)
VALUES
  ('#tdd'),
  ('#littlea2biga'),
  ('#catlife'),
  ('#l33t'),
  ('#swagger'),
  ('#nyc'),
  ('#stackoverflowin'),
  ('#recursion'),
  ('#danielquality'),
  ('#2samovars4coffee');

INSERT INTO tweets (body, ta_id)
VALUES
  ('here come dat tweet', 4),
  ('oh snap whaddup', 4),
  ('love me some young pope', 4),
  ('the files are IN the computer?', 14),
  ('def recursion; recursion(); end', 2),
  ('there be a bear! where? over there!', 6),
  ('you shall not pass!', 6),
  ('Hey ___ Awesome', 1),
  ('You can do it!', 1),
  ('eat plants', 6),
  ('go team', 8),
  ('elm is the best tree', 10),
  ('red, green, refactor', 7),
  ('Semi-colons!', 10),
  ('you done good, kid', 8);

INSERT INTO hash_taggings (tweet_id, hash_tag_id)
VALUES
  (15, 2),
  (3, 5),
  (1, 5),
  (1, 6),
  (5, 7),
  (5, 8),
  (8, 2),
  (9, 2);
