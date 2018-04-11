require 'sqlite3'

# gah no global variables!
$db = SQLite3::Database.new('people.db')
$db.results_as_hash = true

name = "Ned Stark" 
table = "people"

ned = $db.execute(<<-SQL, name: name)
  SELECT
    *
  FROM
    #{table} 
  WHERE
    name = :name
SQL

class Person
  TABLE_NAME = 'people'

  def self.get_all
    data = $db.execute("select * from #{TABLE_NAME}")
    peeps = []
    data.each do |datum|
      peeps << Person.new(datum)
    end
    peeps
  end
  def initialize(options)
    @name, @birthday = options['name'], options['birthday'] 
  end
end

p Person.get_all

