require 'sqlite3'
require 'singleton'

class GotDBConnection < SQLite3::Database
  include Singleton
  def initialize
    super('got.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Person
  attr_accessor :age, :name, :house_id
  def self.all
    data = GotDBConnection.instance.execute("SELECT * FROM people")
    data.map { |datum| Person.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @age = options['age']
    @house_id = options['house_id']
  end

  def create
    raise "#{self} already in database" if @id
    GotDBConnection.instance.execute(<<-SQL, @name, @age, @house_id)
      INSERT INTO
        people (name, age, house_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = GotDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    GotDBConnection.instance.execute(<<-SQL, name: @name, age: @age, house_id: @house_id, id: @id)
      UPDATE
        people
      SET
        name = :name, age = :age, house_id = :house_id
      WHERE
        id = :id
    SQL
  end
end
