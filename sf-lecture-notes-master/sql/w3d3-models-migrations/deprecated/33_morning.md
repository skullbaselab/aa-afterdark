# W3D3

Rails!

+ Roadmap
+ `Migration`
+ `Model`
  + Associations
  + Validations


+ `Cat`
+ `User`
+ `House`
---

## Upside-down Roadmap

+ CSS?
+ Backbone Views/Routing
+ Backbone Models/Collections
+ ... (go learn js)
+ Views
+ Controllers (& routes)
+ Models
+ Migrations
+ SQL

---

## walk through

rails new

```bash
rails new cat_tracker
```

---

## Migrations

+ What is a migration?
+ What's a DSL?
+ `create_table`
+ `t.string :name`
+ What's an Index?

---

## Models
### Associations

+ `belongs_to`
+ `has_many`
+ `has_many :through`

---


**DEMO**:

show how to edit Gemfile
show how to edit database.yml

```bash
rails g migration CreateCat
```

setup the actual migration

```ruby
def change
  create_table :stocks do |t|
    t.string :ticker, null: false
    t.timestamps
  end
end
```

show them how to use ::new, #save, #save!, ::create, ::create!, #destroy
show them how to use ::all, ::find, and ::where.

talk about associations
+ belongs_to
+ has_many
+ has_one

show them to use reload! in the console and warn that they'll need to reassign
any variables after reloading

**DEMO**:
```ruby
class Cat
  belongs_to(
    :owner,
    class_name: 'User',
    foreign_key: :owner_id,
    primary_key: :id
  )
end
```

+ has_many :through

**DEMO**:
```ruby
class User
  has_many :cats
  belongs_to :house
end
```

Show basic validations, valid?, errors, errors.full_messages
Show them add_index talk about indices

