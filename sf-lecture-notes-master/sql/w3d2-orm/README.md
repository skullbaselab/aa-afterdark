# ORM Lecture

### topics
* RBDMS & SQLite3
* DDL
* DML
* ORM

### RDBMS and SQLite3
* RDBMS (relational database management system)
* how to interact with a relational database
* examples: SQLite, Postgres, MySQL, SQLServer
* unfortunately they're all a little different
  * selecting `N` records in a DB is `LIMIT N` in sqlite but `TOP N` in sqlserver

#### SQLite3
* "finger painting of databases"
  * not fully featured, can't do a lot of the things other RBDMSs let you do
    * e.g. can't do a lot of edits on tables. usually have to make a new table entirely
    * doesn't enforce foreign keys by default
* great for development since it's lightweight and it uses a local db file
  * doesn't scale well (concurrency/locking on INSERT), so isn't used in production
* use `sqlite3` gem

##### ACID
I didn't actually talk about this. This was just a question brought up by Zelaznik
last time, so I wanted to be prepared.
* Atomic - All or nothing
* Consistent - Every transaction brings db from one valid state to another
* Isolated - transactions occurring simultaneously are unaware of each other's changes
* Durable - state of db won't be corrupted by power failures or errors

### DDL
* data definition language
* defines the structure of your database
* "designing the house"
* CREATE TABLE, DROP TABLE, ALTER TABLE
* FOREIGN KEYS

### DML
* data manipulation language
* manipulates the data inside the language
* "moving people into the house"
* SELECT, INSERT, UPDATE, DELETE

### brief heredoc aside
it's just a string

### ORM
* object relational mapping
* working with raw data from databases isn't very fun
* wraps data from a database in a Ruby object
  * this way the user never has to physically interact with the database
  * they only ever manipulate regular old ruby objects
* use the sqlite gem to get data from db
* make a simple `Person` class with `initialize` and `get`

#### SQL injection
* show the comic
* talk about ?s and hashes
