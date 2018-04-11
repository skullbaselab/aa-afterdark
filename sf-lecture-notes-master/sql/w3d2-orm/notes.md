# SQLite
* many RDBMS
* many speak SQL, a common interface to get the data out
* serverless: stores data in a file, so it can be passed around
* not super sophisticated, the query planner isn't amazing
* good for small amounts of data
* perfect for development, experiments, and embedded
* imessages are stored in SQLite db, email, anything that benefits from
  fast data lookup
* can create a database `cat table_data.sql | sqlite3 my_db.db`
* this reads the data and sends the output to sqlite3
* sqlite3 has a gem to allow a ruby program to interact with DB data
* meta commands .schema .tables .headers


# Heredocs
* multiline strings? heredocs exist
* `<<-SYM lines SYM`

# School Ruby SQL Demo
* table names: plural and snake case
* `id INTEGER PRIMARY KEY`
* `first_name VARCHAR(255) NOT NULL`
* `Singleton` means we can access the one instance using `instance`
* `results_as_hash`, `type_translation`, set those to true
* can create an instance of SQLite3::Database or inherit from it
* sanatize inputs from user using `?`
* can write code that object orients the usage of a database, classes
  represent tables
