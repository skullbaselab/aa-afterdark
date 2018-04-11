# Topics

### first project
* `gem install rails`
* `rails new MyProj` or `rails new MyProj -d postgresql`
* `byebug`, `pry-rails`
* `bundle`
* change project to postgres

### migrations
* migrations are change history of a DB
* `change` knows how to rollback (usually)
* `rails generate migration my_migration_name`
* `create_table :products { |t| t.string :name }`
* `string, date, datetime, float, string, integer, text, time`
* can change table too `add_column`, `remove_column`, `add_index`
* `t.timestamps` adds created and updated columns
* `rake db:migrate` runs all migration
* `rake db:rollback` undoes last migration
* NEVER edit run migrations
* can run model code in the migration
* if you wonder: how do I? Look it up.

### Object Relational Mapping
* wrote one yesterday
* object-ifies tables and columns in a database
* represents their contents as classes, cols as properties, associated
  objects as pointed to by methods
* `::find` and `::all`
* `::where`, returns an array like object
* add rows by creating instances and saving
* `save` returns bool, `save!` throws error
* `destroy` will remove an instance from the DB
* `rails console` gives access to model layer
* `reload!` refreshes model changes

### Associations: `belongs_to` and `has_many`
* a macro we call at class define time
* adds an instance method that gets objects from table specified
* belongs to returns first record with appropriate primary key (id)
* has many returns ALL with matching foreign key

### Associations: `has_many :through`
* also a macro that creates an instance method that returns an array
* when a table is two hops away, use has many through
* join table: exists to join two other tables
* need to specify which table we are going through using association,
  and which association to use to get to final destination
* can `has_many` through other `has_many` throughs too

### Associations: `has_one` and HABTM
* has one: same rules as has many but returns the first
* `has_one :through` is also a thing
* HABTM we don't advise, has_many through is more flexible (can put more
  columns into join table)

### Rails Conventions
* Convention over Configuration: it's complicated already, keep it
  consistent with rails conventions.
* Rails automatically infers stuff: ModelName = model_names table, file
  names are automatic. Rails is into automagic stuff but we need to work
  as rails expects.
* Foreign keys: `other_model_id`, primary key: `id`

### Unconventional Associations
* tables can belong to themselves (employee manager problem)
* call it reflexive association, ActiveRecord is fine with that.

### Validations
* model level constraints are great because we get the error before it
  becomes a 500 level error.
* also more control over what happens when an error occurs
* `save` returns true or false depending on model level validations
* `valid?` returns true if a record passes validations
* `errors` method returns a hash like object with details of the failure
* `validates :name, presence: true`, `uniqueness` also a thing
* `inclusion`

### Custom validations
* `validate :my_method`
* if method adds an error to errors hash, it fails

### Validations: misc
* 255 is max string length, probably a good idea to add a model
  validation to check
* `:allow_nil` skips validation if property is blank
* `:if` allows validation only if other property is true

### Indexing
* index foreign keys to speed up lookup
* index is a table built by the DB

# Lecture
### What is rails?
* framework: a bunch of classes to solve a problem like .NET
* rails is a framework but quite a robust frame, creating a new project
  is actually a working web server. Just need to add
  models/controllers/views
* An MVC, what does that mean? Just a pattern to organize code.
* show the diagram

### How to get started?
* `rails new AppName`
* talk about Gemfile, add `annotate`, `better_errors`
* `rails s`
* `rails g migration CreateFighter`
* what's a migration

```ruby
def change
  create_table :fighters do |t|
    t.string :name, null: false
    t.timestamps
  end
end
```
* look at schema
* don't edit old migrations!
* make a model
* do some model level validations
* try `valid?` `save` `errors`
* demonstrate difference between just db errors and model errors
* talk about orm
* demonstrate `::new, #save, #save!, ::create, ::create!, #destroy,
  ::all, ::find, ::where`

* talk about associations, make models for gym and coach
* set up associations for has many and has many through
* write them on the board
* add_index and talk about it
