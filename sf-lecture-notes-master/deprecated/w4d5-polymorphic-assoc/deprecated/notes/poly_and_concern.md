## Polymorphic associations
- Why we make them
  - e.g. Liking different types of model
- Syntax
  - look this up
- Example: likeable, users can like posts and comments

## Inverse_of
  - Do example from rails docs
    - c = Customer.first
    - o = c.orders.first
    - c.first_name == o.customer.first_name # => true
    - c.first_name = 'Manny'
    - c.first_name == o.customer.first_name # => false
  - Add inverse_of
  - The problem it solves: When two objects are in memory but haven't necessarily been updated in database

## Rails magic with `#association_id=` method
- many-to-many relation
- users can subscribe to many feeds, and feeds can have many subscribers (join table)
- users must subscribe to at least one feed (model level validation)
  - Problem: In order for the user to be validated (and therefore
    get an id), it needs to have an entry in a join table (their feed subscription). But in
    order for the join table to be valid, it needs a `user_id`,
    which it can't have, because the vassal hasn't been put in the
    database yet. Catch 22!
  - Solution `user.feed_ids = [1, 2, 3]`, deep deep rails magic
    - Under the hood, it grabs the feed association through the reflection object, looks up the ids of the feeds that actually do exist, and saves those ids in the join table when you save the user.

## Concerns
- Rails Super Modules
- Class methods, instance methods, macros
  - included do: `belongs_to :something`
  - class methods: `def self.active; where(active: true); end;`
  - instance methods: `def full_name; "#{fname} #{lname}; end;`

## Order
- make project, make 3 models, one of which polymorphically `belongs_to` to the other two. Demo this.
- add a concern for the `has_many` macro for the other two
- make a join table, show the use of the `association_id=` setter.
