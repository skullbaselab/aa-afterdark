# Week 3 Day 3

### What is Rails?

* Rails is a MVC framework. Gives us a bunch of classes we can inherit from


### Migrations

```sh
> rails new Fighters # create new project
> rails s #run the server
> rails g migration create_fighters # generates a migration
> rails d migration create_fighters # reverts the above migration
> rake db:migrate # runs migration
```

```ruby
class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |table|
      table.string :name
      table.timestamps
    end
  end
end
```
* Look at the schema to see the current state of the database
* Rails has very intuitive error messages

### Models

```sh
> rails g model fighter # create model
> rails c # go into rails console; it's an instance of pry
pry> a = Fighter.new(name: "Ronda Rousey")
pry> a.save!
pry> Fighter.create!(name: "Sarah Kaufman")
pry> Fighter.create!(name: "Sarah McMann")
```
* `create` = `new` + `save`
* `create!` = `new` + `save!`

### Model-level Validations

```ruby
class Fighter < ActiveRecord::Base
  validates :name, presence: true
end
```


### Gemfile
* management of what libraries (and their versions) your project requires
* neat gems:
  * `annotate`
  * `pry-rails`
  * `byebug`

Writing SQL fragments
```sh
pry> Fighter.where('name like ?', "Ron%")
```

### Associations

* `belongs_to` goes in the file with the foreign key, and `has_many` goes in the other file
*



```ruby
class Fighter
  belongs_to(
    :gym,
    class_name: 'Gym',
    foreign_key: :gym_id,
    primary_key: :id
  )
end


class Gym < ActiveRecord::Base
  has_many(
    :fighters,
    class_name: 'Fighter',
    foreign_key: :gym_id,
    primary_key: :id
  )

end
```
An example query for the method `gym` in `Fighter`:
```sql
SELECT * FROM gyms WHERE id = 4 LIMIT 1
```

An example query for the method `fighters` in `Gym`:
```sql
SELECT * FROM fighters WHERE gym_id = 4
```
