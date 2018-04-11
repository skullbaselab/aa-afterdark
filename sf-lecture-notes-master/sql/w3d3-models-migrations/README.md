# Ruby on Rails
(but you can call me _Rails_)

---
## Before we get started...
---

![debugging](https://scontent-sea1-1.cdninstagram.com/t51.2885-15/e35/12724849_1044452372242609_1154271462_n.jpg)

---

![coffee](https://www.homegrounds.co/wp-content/uploads/2017/02/Star-Wars.jpg)

---

![hanging-corgi](https://i.giphy.com/media/mP94uHyKvY1nq/giphy.webp)

---

![you-got-this](https://dollarworkoutclub.com/wp-content/uploads/2015/12/you-got-this-500x348.png)

---

### Main Learning Goal

* Familiarize yourself with Active Record
	+ You're not expected to have this all memorized... yet :)

---

### What is Ruby on Rails?

+ A server-side (backend) MVC web application framework written in the Ruby language.

---

### What are other web-application frameworks?
+ Javascript: Ember, Express (micro-framework)
+ PHP: Laravel, Symfony
+ Python: Django, Flask (micro-framework)
+ Ruby: Ruby on Rails, Sinatra (micro-framework)

---
### What is MVC?
+ A software architectural pattern
+ Divides an application into three interconnected parts
+ Originally developed for desktop graphical user interfaces (GUIs), MVC was one of the first approaches to describe and implement software constructs in terms of their _responsibilities_.

---

![Rails](http://media.tumblr.com/f145fa01dd8cadd28537194de00cda59/tumblr_inline_mptqzmW6Bj1qz4rgp.png)

---

### The Rails Philosophy
+ Don't Repeat Yourself
	+ By not writing the same code over and over again, your app becomes more maintainable, more extensible, and less buggy.
+ Convention Over Configuration
	+ Rails has opinions about the best way to do many things in a web application
  + It defaults to this set of conventions
  + You only configure what differs from the convention.
  + You may hear people refer to it as an _opinionated_ framework

---

### Let's talk about Active Record

---
### Migrations
+ Allow you to evolve your database schema over time.
+ Rather than write schema modifications in pure SQL, you use an easy Ruby DSL (domain-specific language) to describe changes to your tables.

---
### Creating Migrations
+ `rails generate migration CreateUsers`
+ Migrations are stored as files in the `db/migrate` directory, one for each migration class.
+ The name of the file is of the form `YYYYMMDDHHMMSS_create_products.rb` (a UTC timestamp followed by the name of the migration.)
+ The timestamp is used to determine which migrations should be run and in what order.
---
### Example
```ruby
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
```
---

### Common migration methods

* `create_table`
* `add_index`
* `change_table`
* `add_column`
* `remove_column`

---
### Database Constraints
+ Database-level constraints enforce data-integrity (make sure that only valid data is entered)

+ Most common constraints:
	+ `null: false`
	+ `unique: true`

+ It will fail "loudly" by raising an error
---
### Running Migrations
+ `rails db:migrate`
	+ Runs the `change` or `up` method for all the migrations that have not yet been run.
	+ Runs migrations in order based on the timestamp of the migration.
	+ Updates your `schema.rb` file to match the structure of your database.
---
### Changing existing migrations
+ You can't just edit the migration and run the migration again
+ Instead, you have two options: 
  1. Write a new migration (much preferred)
  2. Rollback:
      + rollback the migration (via `rails db:rollback`)
      + _then_ edit your migration
      + run `rails db:migrate` to run the corrected version.
---

# Migration Code Demo

---
### Model
+ The central component of the MVC pattern
+ It expresses the application's behavior independent of the user interface.
+ Represents and directly manages the data, logic, and rules of the application.
+ There is a one-to-one correspondence between a model and what it represents in the world.
---
### Models in Rails

+ `rails g model User` will generate both the model + migrations
+ Ruby classes that implement "validations", "associations", and custom class methods
+ Represent the data in our database

---
### Model-level validations
+ Model objects may be created, updated, and destroyed. This is referred to as the _object life cycle_.
+ Active Record provides _hooks_ into this life cycle so that you can control your application and its data.
+ Validations, like database constraints, are used to ensure that only valid data is saved into your database.
+ These lifecycle methods, also called _callbacks_, allow you to trigger logic before or after an alteration of an object’s state.

---

### Model-level validations cont.

+ Performed at each execution of `save`/`save!` and `valid?`
  + If any validation fails (in other words, returns false), the Ruby object will not be committed to the database
+ Stores any errors in the model object
  + Accessible by calling `rubyobject.errors.full_messages`


---
### Validations Example
```ruby
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
end
```
---

### Common Validations

+ `presence: true`
  + analogous to the `null: false`
+ `uniqueness: true`
  + analogous to `unique: true`
+ Custom Validations


---
### Database constraints vs model validations
+ Model validations are best used to provide error messages to users interacting with your app
+ It's highly likely that
	+ You will interact with the database at some point outside of Rails
  + You will make a mistake in your code that causes invalid data.
+ Database constraints are the last line of defence for data-integrity.
+ Writing constraints is work, but they will save you a lot of pain
---

### Validations Code Demo

---
### Associations
+ Connections between two Active Record models.
+ Make common operations simpler and easier in your code.
+ We don't have to write anymore SQL `JOIN` statements

---
### Example
```ruby
class Post < ApplicationRecord
  #validations go here 
  belongs_to :user,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User
end

class User < ApplicationRecord
  #validations go here 
  has_many :posts,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Post
end
```
---

### Associations Code Demo
---

### Quiz

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/sql/w3d3.md)

---

# ty
