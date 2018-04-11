require 'sqlite3'

db = SQLite3::Database.new('got.db')
db.results_as_hash = true
db.type_translation = true

data = db.execute(<<-SQL)
  SELECT
    *
  FROM
    people
SQL

p data

require 'singleton'
class GOTDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('got.db')
    self.results_as_hash = true
    self.type_translation = true
  end
end


class Person
  def self.get_all
    data = GOTDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        people
    SQL
    data.map{ |datum| Person.new(datum) }
  end

  def initialize(options)
    @id, @name, @age, @house_id =
      options.values_at('id', 'name', 'age', 'house_id')
  end

  def update
    raise "#{self} does not exist in database" unless id

    GOTDatabase.instance.execute(<<-SQL, name: name, age: age, house_id: house_id, id: id)
      UPDATE
        people
      SET
        name = :name, age = :age, house_id = :house_id
      WHERE
        id = :id
    SQL
  end

  def create
    raise "#{self} already exists in database" if id

    GOTDatabase.instance.execute(<<-SQL, name, age, house_id)
      INSERT INTO
        people (name, age, house_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = GOTDatabase.instance.last_insert_row_id
  end
end
