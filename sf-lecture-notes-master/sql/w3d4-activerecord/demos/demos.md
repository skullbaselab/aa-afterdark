# ActiveRecord Demo

Most of this lecture has traditionally been done in the rails console.

This demo uses the `Students`, `Courses`, and `Enrollments` database from
W3D3. You should open that project, add an optional `grade` column to the
`students` table, and then seed the database with [this seed file][seed].
Also, add the `pry-rails` gem so they can look at pretty stuff.

[seed]: ./seeds.rb

## Basic Querying Methods

### `find`, `find_by`, `all` Review

They should already know how to use these, but just a quick refresher for
them to remember that these come from `ActiveRecord` too.

```ruby
User.find(4) # id
Course.find_by(name: "Ruby 101")
Enrollment.all
```

### `where` and `where.not`

Those are great for finding a single row in the DB, but we often want all
rows that match a condition.

```ruby
# simple
User.where(grade: "FR")

# for LIKE
Course.where("name LIKE 'Ruby%'")
# will need the quotes around Ruby%, remember that is what SQL expects

# for IN
User.where(grade: ["SR", "JR"])
```

### `joins`, `left_outer_joins`, `distinct`

In this portion, mention as many times as possible that `joins` takes an
association, not a table name.

First, let's find all the students in Ruby 102. Inefficiently first.

```ruby
Course.find_by(name: "Ruby 102").enrolled_students
```

This works, but notice that we had to run two different queries. One for
`find` and one for the `enrolled_students` association. Let's get the same
information in a single query to the DB.

Note: This will be the first point that it is important to mention that we
need to call the `ActiveRecord` methods on the model that we want
_returned_ in the query. Point out that the default `SELECT` in the query
is `users.*`.

First try:

```ruby
User
  .joins(:enrolled_courses)
  .where(name: "Ruby 102")
```

This will error. Show that the default table in the SQL is `users`.

Then fix it with:

```ruby
User
  .joins(:enrolled_courses)
  .where(courses: { name: "Ruby 102" })
```

Explaining that `courses: { name:` is `courses.name` in SQL.

Let's now return all of the courses currently being taken by upper
classpersons.

```ruby
Course
  .joins(:enrolled_students)
  .where(users: { grade: ["FR", "SO"] })
```

This is great, but we have duplicates! How can we get rid of them?

```ruby
Course
  .joins(:enrolled_students)
  .where(users: { grade: ["FR", "SO"] })
  .distinct
```

Time for hard mode.

Find all courses taught by anastassia that contain seniors. Now this is
interesting because we need to join the same table twice: once to get
instructor info (name) and once to get student info (grade).
`ActiveRecord` will use the actual table name for the first one and alias
the other one for us!

```ruby
Course.joins(:instructor, :enrolled_students)
# Look at the alias on the inner join "enrolled_students_courses"
# Rails is amazing, ty
Course
  .joins(:instructor, :enrolled_students)
  .where(users: { name: 'Anastassia' })
  .where(enrolled_students_courses: { grade: "SR" })
```

Now, let's find the course that doesn't have any students enrolled in it.

```ruby
Course
  .left_outer_joins(:enrollments)
  .where(enrollments: { id: nil })
```

Make sure to mention that we don't need to join all the way to `students`
because `enrollments` will get us all the info we need.

### `select` and `pluck`

This section is to show the difference between wanting `ActiveRecord`
objects or an actual array of values returned. It also covers that the
`inspect` method on `ActiveRecord` objects only prints the attributes
that correspond with columns in the table, but they do exist.

`select` will return an array-like instance with `User` objects.

```ruby
User.select(:name)
User.select(:id, :grade)
```

`pluck` will return an actual array or nested array depending on how many
attributes are plucked.

```ruby
User.pluck(:name)
User.pluck(:id, :grade)
```

Let's do one that's a little more complicated.

Let's find the names of all the courses that andres is in.

```ruby
Course
  .select(:name)
  .joins(:enrolled_students)
  .where(users: { name: "andres" })
```

Now, let's only get the names of the courses in strings instead of
`ActiveRecord` objects. Move the `select` info to `pluck`.
```ruby
Course
  .joins(:enrolled_students)
  .where(users: { name: "andres" })
  .pluck(:name)
```

### `group`

Will be good to mention at some point that if we need to specify

Let's first find how many courses each instructor teaches.

```ruby
User
  .select(:name, 'COUNT(*) as num_courses_instructed')
  .joins(:instructed_courses)
  .group(:id)
```

So we got all the instructors, but wait a second. Where is our count?

```ruby
users = _
users.first
users.first.attributes
# Ah ha! It is in our attributes.
users.first.num_courses_instructed
# Nice!
```

`ActiveRecord#inspect` only prints out the attributes that correspond to
columns in the DB.

Let's quickly do the same thing but pluck them instead.

```ruby
# Just move the stuff in `select` to `pluck` at the end
User.joins(:instructed_courses).group('users.id').pluck(:name, 'COUNT(*) as num_courses_instructed')
```

### `having`

A lot of students will still be confused about how `GROUP BY` and `HAVING`
work, so make sure to be very explicit about the _groups_ being created
and how `having` filters out some of those groups.

Will also be good to mention that since `HAVING` requires an aggregate
function, we _have_ to use a string. No rails magic here :(

Let's find the students who are taking more than 2 classes right now.

```ruby
User.joins(:enrollments).group('users.id').having('COUNT(*) > 2')
```

### `order`, `offset`, and `limit`

These are more straight forward.

Let's find all the students and order them by name.

```ruby
User.joins(:enrollments).group('users.id').order(:name)
```

Tricky, tricky. Need to go through enrollments or we will get instructors
as well.
