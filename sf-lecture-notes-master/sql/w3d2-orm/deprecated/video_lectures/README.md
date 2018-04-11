# Week 3 Day 2


### SQLite3

- serverless and rails default
- tries to figure out what you mean
- Unix `|`
- Heredocs
- meta commands
  - `.help`
  - `.tables`
  - `.schema`
  - `.exit`
  - `.headers on`
  - `.mode column`


Unix commands:
- `cat`: concatenate files and print them out to stdout
  - `|`: redirec input to stdin of the file/command that follows the pipe
- `rm`: remove file
- `rm -r`: remove recursive

### DDL (Data Definition Language)

- `CREATE TABLE`
- `FOREIGN KEYS`
- (`DROP`, `ALTER`)

### DML (Data Manipulaton Language)
- `SELECT`
- `INSERT`
- `UPDATE`
- `DELETE`


### ORM (Object-Relational Mapping)

- map database rows to objects
- `Active Record` is considered an ORM

```sql
CREATE TABLE stocks (
  id INTEGER PRIMARY KEY,
  ticker VARCHAR(10) NOT NULL,
  company_id INTEGER NOT NULL

  /*one way to make a foreign key*/
  FOREIGN KEY (company_id) REFERENCES companies(id)
);

CREATE TABLE companies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255) NOT NULL
  /*another way to make a foreign key*/
  stock_id INTEGER NOT NULL REFERENCES stock(id)
);

INSERT INTO
  companies
  (name)
VALUES
  ('Apple'), ('Google'), ('Amazon');

INSERT INTO
  stocks
  (ticker, company_id)
VALUES
  ('APPL', 1);
```

```ruby
require `sqlite3`

class StocksDatabase < SQLite3::Database
  include Singleton

  def initialize
    super("stock.db")
    self.results_as_has = true
    self.type_translation = true
  end
end

class Company
  attr_accessor :name, :id

  def self.all
    # this is a heredoc
    raw_companies = StocksDatabase.instance.execute(<<-SQL, 7)
      SELECT
        *
      FROM
        companies
      WHERE
        id = ?
    SQL

    raw_companies.map do |complany_hsh|
      Company.new(compnay_hsh)
    end
  end
```

### Paramaterization
- Paramaterize in order to avoid SQL injection!
  - use `?` to escape malicious input
