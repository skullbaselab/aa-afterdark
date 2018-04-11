## Starting a new Rails project

* Very basic `rails g` and tour of what a default rails project looks like

## Migrations

* Migration: paper trail, record of how the database got to its current state
  * Changes structure of db, not content
* Create database
* Run migration to create cats table
* Rolling back migration to add `cat_id`
* Adding column to track `color`

## Models

* Interact with content of database
* Getters and setters are built into all models, AR
* Create instances from rails c

## Basic Associations

* Wrote methods with sql, replaced with AR associations
* `beach.cats = Cat.all` -- can assign to association.  Not only getter but also setter
* `r.cats << Cat.first`
* Association provides lots of methods

## More Associations

```ruby
  has_many :toys
    through: #name of association in this class
    source: #target association from association class
```

* There is no `belongs_to through:`, only `has_many through:` and `has_one through:`
* Regardless of association type, with always use `has_one` or `has_many` to go through

## Validations

* Never want it to be possible for a database level error to be thrown
* Add a layer of defense at the model layer
  * Example didn't throw an error, returned false
* `.valid?` - will return true if instance is ready to be inserted into the database
* `Cat.all.pluck(:name)` - return an array of all the names
* `c.errors` - return hash of all errors.  or `c.errors.full_messages`
* Custom validation:

```ruby
  validate :no_green_cats

  def no_green_cats
    if self.color == "green"
      self.errors[:color] << "can't be green"
    end

  end
```

* `save!` -- if you fail a model level validation, it will raise an exception
  * failing a db level validation will always raise an exception

## Indices

* Speed up lookup in our AR tables
* Just a data structure, a tree
* Improves lookup time from linear to logarithmic
* Indexes take up space, thus do not create them for everything
* Use indices for DB-level validation for uniqueness
