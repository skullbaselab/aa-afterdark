# Lecture

---

### Solutions Questions

---

### Overview
+ what is rails?
+ creating a rails app
+ migrations
+ models
+ associations

---

### Upside-down Roadmap

+ CSS
+ Flux
+ React.js
+ ... (go learn js)
+ Views
+ Controllers (& routes)
+ Models
+ Migrations
+ SQL

---

### What is rails?
+ framework: some classes to solve a problem
+ Qt, .NET, frameworks, bunch of classes to use / inherit from
+ Rails is a robust web application framework
+ creating a new project is actually a working web server
+ just need to add models/controllers/views.
+ MVC - Just a pattern to organize code.
+ show the diagram

---

### How to get started
+ `rails new  AppName -d postgresql`
+ talk about Gemfile, add `annotate`
+ `rails s`
+ **demo**: create app, tour your new home!

---

### Migrations
+ history of db changes, current state => schema
+ `rails g migration CreateFighter`
+ `change` method
+ `string, date, datetime, float, string, integer, text, time`
+ `add_column`, `remove_column`, `create_table`
+ `t.timestamps`
+ `rake db:migrate`, `rake db:rollback`
+ **never** edit/delete migrations that you have run already
+ don't know it: look it up :)
+ **demo**: make fighters

---

### What a migration looks like
```ruby
def change
  create_table :fighters do |t|
    t.string :name, null: false #this creates DB constraint
    t.timestamps
  end
end
```

---

### Models
+ ActiveRecord is an ORM
+ Ruby Classes representing DB tables
+ make it easy to insert/update/query
+ `::new, #save, ::create, #destroy, ::all, ::find, ::where`
+ **demo**: make model for fighters

---

### Rails Console
+ `rails c`
+ irb/pry - actually can be pry if you use `pry-rails` gem
+ loads the entire rails model layer (no controllers/views)
+ mostly used for experimenting with models
+ EXPERIMENT CONSTANTLY

---

### Validations
+ can prevent 'bad' data from getting into the DB at model level
+ model level provides more control/better feedback
+ redundancy is good for database protection
+ **demo**: add validations for names, `#save! vs #save`

---

### Associations
+ `belongs_to` - table with foreign key
+ `has_many`
+ all macros that write instance methods
+ if the table has `something_id`, it `belongs_to :something`
+ **demo**: add gyms, coaches, and associations

---

### `has_many xxx, through: ...`
+ have to specify `source` and `through`
+ through is the name of method to midpoint
+ source is name of method from midpoint to destination

```ruby
class Student < ActiveRecord::Base
  has_many :courses#...
  has_many :teachers,
           through: :courses,
           source: :teacher
  # through is the name of an association on THIS model
  # source is the name of association on COURSE model
end
```

---

### Indexes
+ records stored in order of entry
+ have to linear search to find things, `O(n)`
+ store in a binary tree to make lookup faster, `O(log n)`

```ruby
def change
  # add_index :table_name, :column_name
  add_index :fighters, :name
end

```

---

### Key Concepts
+ rails: basics and how to create a project
+ migrations: basics, usage, database constraints
+ rails models: basics, syntax
+ model validations: basics, syntax
+ `belongs_to`, `has_many`
+ indexes: basics, syntax
