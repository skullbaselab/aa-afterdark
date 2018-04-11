# Review
---

## Migrations and Models

### Indices

Indices speed up searching and allow uniqueness constraints. **You must
add indices** to all foreign key columns.

---

### Database Constraints

- `null: false` (argument to `add_column`, `change_column`, or
  `t.data_type`)
- `unique: true` (argument to `add_index`; must come after the
  `create_table` block)
---

### Model Validations

- `presence: true`
- `uniqueness: true`
- `uniqueness: { scope: :other_column }`

---

## Seeding the Database

```rb
# db/seeds.rb
User.destroy_all

User.create!(email: "jeff@appacademy.io")
User.create!(email: "ned@appacademy.io")
```

Your seed file will be run every time you run `rake db:seed` or `rake
db:reset`.

---

## Associations

When deciding between `belongs_to` and `has_one`/`has_many`, consider
this:

1. Where is the foreign key, and where does it point?
  - If `self` has a foreign key that points to a different model
    instance (row in the database), use `belongs_to`.
  - If other model instances (rows in the database) have foreign keys
    that point to `self`, use `has_many` or `has_one`.
2. How many associated records are there?
  - `belongs_to` will always return a single record. Otherwise, let this
    answer determine whether you use `has_many` or `has_one`.

---

### W3D4 Lecture ###
## You mean we still have to know SQL? ##

---

## Goal for today's lecture and project ##
Getting more practice with SQL, and learning how to leverage ActiveRecord to
allow us to make powerful and efficient queries against our DB with less
boilerplate


---

## Overview ##
* Relations
* Conquering the dreaded N + 1 query
* A tour of active record query methods

---

## Relations ##
* Array-like objects that contain the results of DB queries done through AR
  queries and associations
* Lazy-evaluating
* Chainable (with other AR query methods)
run the query.
* Caching

---

## N + 1 Queries ##
* Usually caused by iterating over an active record collection and calling an
  association each item.
* This results in 1 query to get the collection and N queries to get the
  association data for each item

```rb
house = House.first
# N + 1 query
house.people.each do |person| 
  p "#{person.name} has #{person.cats.length} cats"
end

# 2
house = House.first
house.people.includes(:cats).each do |person| 
  p "#{person.name} has #{person.cats.length} cats"
end
```

---

## Nested relations with includes ##
* If you have users, posts, replies you can nest include
* `User.includes(posts: :replies)`

---

## Joins vs includes ##
* Joins doesn't select included association data
* Includes uses either 1 or 2 queries and includes association data

---

## Query Methods ##
### select ###
* `select` determines which columns to include in results.
* Can result in `nil` attributes or additional hidden methods
* Example: People with their number of cats

---

### where ###
* raw string: useful, but remember little bobby tables
* fragment: `?` wildcard or placeholders and values following
* hash: keys are columns, values are value, array, or range

* note: You can reference associations in `where`
```
User.joins(:posts).where("posts.created_at < ?", Time.now)
```
---
## Other Query Methods

- `find`
- `find_by`
- `order`
- `group`
- `having`
- `count`
- `sum`
- `average`
- `pluck`
---

### find_by_sql ###
* :( or :) ?

---
## Advice for today's project ##
* Write SQL first
* AR doesn't shield you from knowing SQL just from it's unsightly appearance
* Look at the SQL query being run in the rails console when your AR queries 
don't work


