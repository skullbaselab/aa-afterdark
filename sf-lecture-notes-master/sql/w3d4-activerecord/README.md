# W3D4

---

![winter-corgi](https://media.giphy.com/media/DLEOWCHRnoUKI/giphy.gif)

---

![ideal](https://media.giphy.com/media/fhAwk4DnqNgw8/giphy.gif)

---

![realistic](https://media.giphy.com/media/Tw5wtzDHAP6P6/giphy.gif)

---

## Active Record Toolbox

---

## Agenda

* Active Record Relations
* Active Record Methods
  * N+1 queries
* Quiz Solutions
* Open forum

---

## Active Record Relations

* Ruby objects
* Array-_like_
* Enumerables
* Lazy (efficient)

```ruby
Kitten.select(:name).where(id: (1..4)).order(age).limit(5).last
```

---

# Active Record Methods

---

## Ruby Hash Review

```ruby
{ :a => "d", :b => :c}
```

is the same as

```ruby
{a: "d", b: :c}
```

which is the same as

```ruby
a: "d", b: :c
```
Which will you use?

---

## As seen in... Associations!

These just methods, really

```ruby
class Lawyer

  has_many :cases,
  	primary_key: :id,
  	foreign_key: :case_id,
  	class_name: "Case"

...

end
```

```ruby
has_many(:cases, { :primary_key => :id, :foreign_key => :case_id, :class_name => "Case"})
```

---

## CRUD methods review
* `#create`
  * `#new`
  * `#save`
* `#update`
* `#delete`

---

## Where's the `R`?

(it's in the SQL)

---

## Do you want to write this?

```ruby
class QuestionFollow
  def self.most_followed_questions(n)
    questions_data = QuestionsDatabase.execute(<<-SQL, limit: n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows
      ON
        questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        :limit
    SQL

    questions_data.map { |question_data| Question.new(question_data) }
  end
end
```

---
## Or this?
```ruby
class QuestionFollow
	def self.most_followed_questions(n)
		Question.joins(:question_follows).group(:id).order("COUNT(*)", :desc).limit(n)
	end
end
```
---

## How about this?

```ruby
class QuestionFollow
	def self.most_followed_questions(n)
		Question
			.joins(:question_follows)
			.group(:id)
			.order("COUNT(*)", :desc)
			.limit(n)
	end
end
```

---

## N+1 queries

* Usually caused by iterating over an Active Record collection and calling an association on each item
* This results in 1 query to get the collection and N queries to get the association data for each item

```ruby
teachers = User.joins(:taught_classes)

teachers.first.taught_classes.each do |class|
  #N+1 query
  p "#{class.name} has #{class.students.length} students"
end
```

---

## Can we do `#joins`?

In SQL we can do `JOIN`...

No.

---

## `#joins`

`User.joins(:enrolled_courses)`

≠

`SELECT * FROM users JOIN enrollments ON users.id = enrollments.student_id`

but rather

`SELECT users.* FROM users JOIN enrollments ON users.id = enrollments.student_id`

Note: teachers.second.taught_courses.map { |course| p "#{course.name} has #{course.enrolled_students.length} students"}
---

## Enter `#includes`

* Preloads the associated tables
* Hits the database one (or two) times
* Can nest (use a hash)

```ruby
# teachers = User.joins(:taught_classes)

teachers.first.taught_classes.includes(:students) do |class|
  #N+1 query
  p "#{class.name} has #{class.students.length} students"
end
```

---

## `#where`

* Works an awful lot like `WHERE`
* Can take a string (SQL fragment)
  * Don't forget Little Bobby Tables
  * Will take two arguments
* Should take a hash
  * Key is a symbol
  * Value can be an integer, string, range, or array
    * This is way cool

---

## Other cool `#where` stuff

* `#not` chains onto an argumentless where
* `#where` can reference associations (if you `#joins`)
  * Must use table name

---

## `#find`

* Take an integer
* Finds by primary key (:id)

---

## `#find_by`

* Takes a hash
  * key is a symbol, column name
  * value is like where
`User.find_by(name: "Kelly")`

Also the "old way" (don't do this)
`User.find_by_name("Kelly")`

---

## `#find_by_sql`

* When you just have to write the query
* Pretty much replaces heredoc
* ≠ `find_by(sql: "...")`

---

## `#where` vs. `#find`

* `#where` returns an Array-like object (the relation)
* `#find` returns a single object

* Do _not_ use `#where` when you mean `#find`

---

## `#order` and `#group`

* For the most part intuitive
* `#order` will often take a SQL string (aggregate)

```ruby
Course.joins(:enrolled_students).group(:id).order("COUNT(*)")
```

---

## `#select` isn't doing what I want

```ruby
Course
	.select(:name, "COUNT(*)")
	.joins(:enrolled_students)
	.group(:id)
	.order("COUNT(*)")
```

There's got to be a better way...

---

## `#pluck`

* Takes symbols
* Like a `#select` with a `#map`
* Very important once your stack becomes full
* Method on an AR relation object only (can't use on single objects)

---

## Choose wisely

* If you have a choice you choose a _hash_
* If you have a choice you choose a _symbol_
  * try it tonight: `class_name: :Company`

---

## Summary

* `#joins`, `#includes`
* `#where`, `#not`, `#select`, `#distinct`
* `#find`, `#find_by`, `#find_by_sql`
* `#group`, `#order`

---

## Lastly, READ THE DOCS

* Google
* _Active Record Query Interface_ from _Rails Guides_
* _APIDock_ Rails section
* Just try to break stuff
  * Is`#having` a method?

---

## Quiz Solutions

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/sql/w3d4.md)

---

## Open Forum
