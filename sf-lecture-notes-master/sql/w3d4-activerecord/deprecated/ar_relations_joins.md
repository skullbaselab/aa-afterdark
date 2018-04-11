# To Demo:

* Relations:
  * How relations are returned (e.g. where, association)
  * How they're lazily evaluated
  * How they cache results
  * How they can be combined
  * How to clear the cache (pass true to association or call reload)
* Includes & Joins:
  * N+1 query implementation
  * Preloading with includes
  * Aggregating data with joins and select
  * Nested joins
  * Outer joins
* Defining a scope via a class method
* default_scope
* Querying:
  * pluck
  * order
  * group
  * count
  * select
  * find_by_sql

# Demo Steps

* `rails new w3d4_demo`
* Add development gems
```ruby
group :development do
  annotate
  pry-rails
end
```
* Create users model:
  * Columns: first_name, last_name, email
  * Annotate
  * Model validations
  * Associations:
    * `has_many :questions`
    * `has_many :replies`
    * `has_many :question_followings`
    * `has_many :followed_questions, through: :question_followings, source: :question`
* Create questions model:
  * Columns: title, body, author_id
  * Associations:
    * `belongs_to :author`
    * `has_many :replies`
    * `has_many :question_followings`
    * `has_many :followers, through: :question_followings, source: :follower`
* Create question_followings model
  * Columns: follower_id, question_id
  * Unique index on follower_id and question_id
  * Associations
    * `belongs_to :follower`
    * `belongs_to :question`
* Create replies model:
  * Columns: body, question_id, user_id, parent_id
  * Associations:
    * `belongs_to :question`
    * `belongs_to :user`
    * `belongs_to :parent`
* Run seed data (see below)
* Demonstrate relations in console via where
  * Use `; nil` to prevent relation from querying after definition
* Make `User#question_replies_count` to demonstrate N+1, includes, & joins
  * Demonstrate `group`
  * Demonstrate `select`
  * ADD CODE HERE
* Make scope `Questions::most_recent`
  * Demonstrate `order`
  * ADD CODE HERE
* Make `Question::all_titles`
  * Demonstrate `pluck`
    * `Question.all.pluck(:title)`
* Make `Question#children`
  * Demonstrate `find_by_sql`
* Make `User#average_question_follows`
  * Demonstrate `joins('LEFT OUTER JOIN...')`

# Seed Data

```ruby
ActiveRecord::Base.transaction do
  User.create!(
    first_name: 'Will',
    last_name: 'Hastings',
    email: 'will@appacademy.io'
  )
  User.create!(
    first_name: 'Jeff',
    last_name: 'Fiddler',
    email: 'jeff@appacademy.io'
  )
  User.create!(
    first_name: 'Ned',
    last_name: 'Ruggeri',
    email: 'ned@appacademy.io'
  )

  Question.create!(
    title: 'How do I avoid N+1 queries?!',
    body: "They're making my app too slow!",
    author_id: 1
  )
  Question.create!(
    title: 'Why do my models have stale data?',
    body: "I just can't figure it out...",
    author_id: 1
  )
  Question.create!(
    title: 'When is the next UFC match?',
    body: "I don't wanna miss it!",
    author_id: 2
  )
  Question.create!(
    title: 'Where can I find more cute cat photos?',
    body: "",
    author_id: 3
  )

  QuestionFollowings.create!([
    { follower_id: 2, question_id: 1 },
    { follower_id: 3, question_id: 1 },
    { follower_id: 3, question_id: 2 },
    { follower_id: 1, question_id: 4 }
  ])

  Replies.create!(
    body: 'Use joins, foo!',
    question_id: 1,
    user_id: 2,
    parent_id: nil
  )
  Replies.create!(
    body: 'Also, includes can help too.',
    question_id: 1,
    user_id: 3,
    parent_id: 1
  )
  Replies.create!(
    body: 'Caching, duh!',
    question_id: 2,
    user_id: 3,
    parent_id: nil
  )
  Replies.create!(
    body: 'You can call reload on the model object to clear its cache.',
    question_id: 2,
    user_id: 2,
    parent_id: nil
  )
  Replies.create!(
    body: 'In my experience, they are everywhere.',
    question_id: 4,
    user_id: 1,
    parent_id: nil
  )
end
```
