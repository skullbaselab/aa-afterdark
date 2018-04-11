# Review

## Options for `rails new`

- `--database=postgresql`
- `--skip-test-unit`
- You can add options to a `.railsrc` file in your home directory.
  - `rc` stands for **Runtime Configuration** and determines the
    settings used when you run the command.

## Migrations and Models

### Indices

Indices speed up searching and allow uniqueness constraints. **You must
add indices** to all foreign key columns.

### Database Constraints

- `null: false` (argument to `add_column`, `change_column`, or
  `t.data_type`)
- `unique: true` (argument to `add_index`; must come after the
  `create_table` block)

### Model Validations

- `presence: true`
- `uniqueness: true`
- `uniqueness: { scope: :other_column }`

## Seeding the Database

You can set up some "sample" data in your database by adding to the
`db/seeds.rb` file. This is way better than creating database records
manually in the `rails console`. Prefer to create your test data here.
Example:

```rb
# db/seeds.rb
User.destroy_all

User.create!(email: "jeff@appacademy.io")
User.create!(email: "ned@appacademy.io")
```

Your seed file will be run every time you run `rake db:seed` or `rake
db:reset`.

# ActiveRecord

## Associations

### What Do They Give You?

Let's say we have a `User` class for which we define a `cats`
association.

```rb
class User
  has_many(
    :cats,
    class_name: :Cat,
    foreign_key: :owner_id,
    primary_key: :id
  )
end
```

When Rails reads the class definition and parses our association, it
writes an instance method that looks something like this:

```
class User
  def cats
    Cat.where(owner_id: self.id)
  end
end
```

The exact behavior of the method depends on the options we pass to the
association declaration. The important thing to note is that an
association is just a **recipe for a query**. Once we have an
association, we should never again have to write queries of the form
`AssociatedClass.where(foreign_key: self.id)`

Rails does a lot of cool things on top of just providing the `where`
query described above. First, the association method *caches the results
of the query*. This means that if we ask for the same user's
`cats` twice, only one query gets run. You can override this
caching behavior by passing `true` as an argument to the association.
Finally, Rails doesn't just write one method; it writes a whole bunch.
You can see a detailed list [here][association-methods].

[association-methods]: http://guides.rubyonrails.org/association_basics.html#detailed-association-reference

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

## Relations

Relations are Array-like objects contain the results of a database
query. You will see these returned from associations and other query
methods. A few important points:
- Relations are **lazily evaluated**.
  - You can chain ActiveRecord query methods on top of a relation, and
    no queries are actually run until the result is required.
  - Calling any "vanilla Ruby" methods, such as `each`, `map`, or
    `puts`, will terminate the chain and run the query.

## Query Methods

- `select` determines which columns are included in your results. If you
  call `User.select(:username)`, then all of the User objects you get
  back will only have a `username` attribute (and not `id`, `email`, or
  any other attributes).
  - Any column names or aliases that appear in your `select` will be
    available as methods on the resulting models. For example,
    `User.select("username AS nick")` will give us User models that
    respond to a `nick` method, which will return their username. This
    can be useful when using `group` statements and aggregate functions!

- House.first.people.select("people.*, COUNT(cats.id) AS
num_cats").joins(:cats).group("people.id");

## N + 1 Queries

Let's say our database contains Houses. Each House has many Humans, and
each Human has many Cats. If we wanted to print how many cats each person living in a house had,
we could do something like this.

```rb
# N + 1 query
House.first.people.each do |person| 
  p "#{person.name} has #{person.cats.length} cats"
end

# 2
House.first.people.includes(:cats).each do |person| 
  p "#{person.name} has #{person.cats.length} cats"
end
```

The first way will be an N + 1 query because when we iterate over the `humans`, 
we have to run a brand new query to get the `cats` for each one. Remember
what we said above: calling a "vanilla Ruby method", like `map`, halts
the chaining of ActiveRecord methods and runs the query immediately.

The second way


So what's the problem? Although joining and filtering happen very
quickly inside of a single query, there's a high computational overhead
for connecting to the database and initiating *new queries*; therefore
we want to keep the number of queries we make to a minimum. In this
(stereotypical) case, we've run **1** query to get the humans for a
house, plus an additional query to get the cats for each of **n**
humans. Hence, this is commonly called the **n + 1 query problem**.

What's the solution?

## Pre-fetching

We saw above that calling a Human's `cats` method once will run a query,
and subsequent calls will use the cached result. What if we could cache
the result when we queried for the human in the first place? It turns
out we can.

```rb
House.first.cats # problematic; triggers n + 1 query

House.includes(:humans).first.cats
# prevents the query to get from house to humans, but we still make n
# queries for cats

House.includes(humans: :cats).first.cats
# Bingo! We've pre-fetched and cached the humans for each house, as well
# as the cats for each human.
```

Most commonly, you'll see `includes` used to pre-fetch associated data
in this way. There are other methods that behave similarly (with subtle
differences). You'll want to pick the one that best fits your use case.
Here's a breakdown:

- `preload`: pre-fetches by making two `SELECT`s in sequence.
- `eager_load`: pre-fetches by making a single query with a `LEFT OUTER
  JOIN`
- `includes`: tries to intelligently chooses between one and two queries
- `joins`: joins to an association, but doesn't pre-fetch any
  association data.

## Other Query Methods

- `find`
- `find_by`
- `order`
- `group`
  - `having`
  - `count`
  - `sum`
  - `average`
