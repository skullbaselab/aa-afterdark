# W3D3 Lecture Notes

## 02/28/2018

Lecturer: Tommy
Scribe: Aaron

+ I saw somewhere that they didn't have an id column, do we always need to
  do that?
  + You can overwrite that default within Rails, but 


## 12/20/17
## Lecturer: AJ
## Scribe: Aaron

### Q's

+ Could you briefly explain the `t.timestamps` for us?
+ What is the `|t|` in the migration file?
+ Is it bad practice to change the methods in our migration or should we run it in the terminal?
  + Those methods are always in the migration file
+ How do we run a migration?
  + `rails db:migrate`
+ Can you use convention to automatically have the migration filled with methods other than `Create`?
+ Does run new migrations make you lose your database info?
  + No it doesn't, unless you rollback a creation of db migration.
+ This reminds me of git, should we make out messages similar?
  + Yes and no. Some commit messages get long, but we want to know what's going on
+ When you write a new migration, do you name it the same?
+ Why does it create two databases?
  + One is used for running tests, the other is for development
+ If it changes both, why do we need two?
  + The structure is the same, but the information it holds is different
+ Do we have to use symbols?
  + You should be able to use both, but symbols are preferred
+ Explain t.timestamps again
+ Is it possible change multiple tables in the same migration?
  + Yes, but that goes against 
+ Does it automatically make an `id`?
+ Can we change the primary key to be the username?
+ In the videos, `ActiveRecord::Base` was used. Is that a diff for Rails 5?
+ How is the timestamp determined?
  + It is UTC
+ Is UTC Greenwich?
  + Yes
+ When adding an email column, could we technically rollback here?
  + Yes, but let's practice without rollback
+ So we don't have to copy the rest of the table?
  + Nope, just what is being changed for the table
+ There is no `create_table` because we aren't creating one?
  + Yes
+ How would we have a chirp be a reply to another chirp?
  + Let's talk during open forum. Could have answered: put a foreign key
+ What if we created tables in PSQL?
  + That would be a bad idea, it won't be reflected in our schema
+ Is there a way to manually link a model to a table?
  + That would stray from Rails convention so we don't want to do that
+ Why is the colon on different sides?
  + When on the right, it is a part of an options hash
+ Can you also use the rocket hash?
  + Yes, but that is considered outdated
+ How could we look up how the `validates` method works?
  + Rails docs are awesome
+ Does the validates take in the column names and options hash?
  + yes
+ When we say `body.length`, are we referencing the body of our table?
  + Yes, ActiveRecord gives us `attr_accessor`s
+ Does uniqueness check case?
  + By default, I believe that it does
+ How do we test the database level validations?
  + Do it before you write the model level because your models should cover all of your database validations
+ Saw in some apps that not all of the association keys are given.
  + These are short hand associations if we follow Rail's convention. There will be a time and place to use it.
+ There is an `id` in both the posts and users table, how does it know which one to use?
  + That is dictated by the type of of association
+ Can we name the association anything?
  + Yes
+ Not sure how the `foreign_key` in the has many works with the Users table
  + It is referencing the Chirps table

# 10/18/17
# Lecturer: David
# Scribe: Jesse

## Q's

* are the other frameworks also mvc?
  * not all of them, there is also mvvm(angular). there are other options out there
* what is the view vs actually displaying it on the webpage
  * there is a "view" template, but that will get explained later on in the curriculum
* when you say that you needed to specify a down method, is that only if you plan to rollback?
  * don't typically plan to rollback, but it happens, so making sure it can be done correctly in that event is advantageous
* how would up and down interact with a change method
  * I wouldn't use change, I would use a different down method all together
* is it all or nothing, if I create a table and then migrate it, would it be bad if I wanted to roll back just part of that table, if i put many things in that first migration, aren't I more likely to make mistakes too
  * best practice would be just to make the table initially with the minimum product necessary, and then if later changes are necessary, the decision at that point would be to either rollback or to just make a change to the table itself using a new migration
* using add_index takes up a little bit of space, but generally not that much, so why wouldn't we just index everything
  * it still requires maintaining, and while you are right, that if it doesn't take a ton of space maybe we should use it, but it isn't necessarily best practice, however it wont break your app or anything like that
* if the interest is to save time, why wouldnt we then index everything
  * it does take up space even though it can be considered minimal, and it's really just saving you as the programmer a little extra time/brain power more than anything
* is rails actually just calling "rake" under the hood?
  * rake is a ruby program, that was typically used to run commands through rails, but now convention and best practice with rails 5 is to just use rails
* when you create a model, does it create that stuff you showed us previously?
  * when you run rails g model .... it creates the migration file, but you would need to fill out that migration file yourself
* first time migrate gets run, it throws an error that you need to create the database first
  * I generally create the database once that happens, but technically you could just create the database from the jump if that happens
* if you rollback and delete a column, would you lose that data?
  * yes
*  If you forget to add a column, what is best practice in that scenario?
  * generally best to just add a new column and change the existing table
* unique vs uniqueness?
  * db level is unique, and model level is uniqueness
* -d=postgres vs -d postgres
  * equal sign is more common, but space works too
* is the .git repo always created by default
  * yes, if you didn't want it there, you can delete it or somewhere maybe change the default
*  can you add multiple columns in the short hand
  * yes, just chain them all after the name of the table creation
* when you say rails db:drop, how does it know which one to drop?
  * it will infer based on the name of the application/directory that you are in
* why does it make two db's when you run rails db:create aka test/development
  * you can have different versions of your app depending on what stage of development you are in, so those different versions are for those different stages
* i used SQLite last night and it didn't require me to explicitly create a database, why do you have to here?
  * in postgres, we have to explicitly create the database, because it doesn't store the data right in your file, it keeps in its separate postgres db
*  earlier you said db level validation is safer than model level validations
  * they are a "stronger" defense, there are ways to access the db after bypassing the models and then if there weren't any constraints, it could mess up your db, double protection in this case is more advantageous
* if we try to save an object, but it fails what happens
  * the object doesnt get destroyed, but it also doesnt affect your db
* difference between save and save!
  * save: fails silently, but save! fails and returns an error
* difference between inheriting from ApplicationRecord vs ActiveRecord
  * there is a reading discussing the differences as well, but it is a rails 4 v rails 5 difference
* rails g model vs rails g migration
  * g model creates both a model and a migration, while migration only does the 1
* rails adds an "s" to the end?
  * yes, one of the many rails conventions
* if we do validation in the model level for uniqeness, we dont need to to do it in the migration
  * technically you dont "need" to, and one is definitely better than nothing, but best practice is to do it at both levels just to ensure db integrity
* does the oder matter in the assocations options hash?
  * nooooooooope
*  sometimes the values are strings as opposed to symbols, does it matter
  * nooooooooope, it shouldn't. rails takes both
* do we have an author_id column
  * in our db we wrote author_id in order to be more semantic/specific so using a semantic name in author instead of user, it makes it easier for us to read, but will ultimately mean that we have to speify the user class in that association otherwise rails will look for an author class
* in this has_many association, what is the through: referring to?
  * the previous association that we defined above, within the same model
* is the has_many through of liked_posts a joins table?
  * it creates a temporary join where our db is able to be queried to find the relevant information
* belongs_to vs has_many?
  * they are two sides of the same coin, we write them from both ends, so that we can make the association from both directions, but technically you could just write one side and you would be able to use that association, but you could only access that information one way.
* 
  *
*
  *
*
  *
*
  *
*
  *
*
  *
*
  *
*
  *
*
  *

## Feedback

* Tell students to test things themselves.
* Defer Q's to after the demo.

## Homework

* Symbols vs. strings
* Is it better to have `owner_id` or `user_id`?
* `find_by` method?

## Quiz

* `new` + `save` vs. `create`?
* Naming best practice?
  * Be descriptive.
* What goes in options hash?

# Date__
# Lecturer: Kelly
# Scribe: Dallas

## Q's

* What's the diff between `rails g migration` and `rails db:migrate`?
  * rgm creates the skeleton; rdbm takes that skeleton and implements them in your db.
* How do we make changes to migrations if we can't change the migrations after implementing them?
  * You will need to create a change-migration file. Move forward, not backword.
* Can I add a DB-level constraint using AR?
  * We'll get to it in a minute.
* Say you made a mistake, how do you fix it?
  * If it migrates *successfully*, then you will need to create a new migration-file and run that migration. If it does not migrate successfully, you can change the original file.
* Options hash?
  * Optional paramaters for constraints or types for the tables being created/modified
* Rails 5.1.x!! :)
 * :)
* Where are the migration files located?
  * `db/migrations`
* Why is the uniqueness in the `add_index` and not in the `create_table`?
  * AR does not give us the option to put in the `create_table`
* Does adding an index change the way we query the DB?
  * Nope, just speeds it up.
* Does `rails db:migrate` just create the file or does it do other stuff?
  * Just creates the file.
* In SQL we set the foreign keys. Do we do that in Rails?
  * We can, but we don't need to.
* What is the timestamp used for?
  * So that when the DB is reset or setup on a different machine, the migrations are run in the correct order.
* Seeds file?
  * For creating test/static data in our apps.
* Seeds for production vs development?
  * You can set it up for both.
* Multiple pending migration?
  * Runs all of them, but individually.
* Does rollback rollback all from a `db:migrate` command or just one?
  * Rollback rolls back just one.
* ?????
  * Will be answered in future lectures that have the other components of rails app.
* Does the pluralize work for weird words?
  * Not always. Try it.
* Does the class-name on migrations matter?
  * Only if we care about the automatic stuff. Sometimes we don't
* Timestamps?
  * Keeps track of creation/modification date-times
* Indexing... something... ?
  * Out of scope for now. Save for open-forum.
* Did annotate create new files?
  * Nope.
* Does migrating update the schema in the model file
  * Nope.
* Does id have a getter and a setter?
 * Yes. Don't use it.
* Can you overwrite them ^?
  * Yes. "Ha!"
* Why doesn't it complain about the author_id not pointing at an author?
  * We haven't set up relations/associations, and we didn't set it as a foreign key in our DB.
* Long-handed way vs short-handed way?
  * Do the long-handed way for now.
* Does the association have to match the exact classname?
  * Not always, but it's best to do so. Including capitalization.
* Does it have to be called 'likes'?
  * Nope.
* If you have data stored in seeds file, is it reloaded on `reload!` in rails-pry?
  * No. It's just accessing what is already stored in the database. We manually seed.
* `through` goes through the joins table?
  * Yes.


## Feedback

* Tell students to test things themselves.
* Defer Q's to after the demo.


* Lecturer: Jenn
* Scribe: Luke

## Projects

* `find_by` in ModelBase, how to get class name?
* `tabelize` method?
* Are class methods inherited?
* What is Rake?
* Migrations vs. git?
* Development vs. production gems
* Seed file vs. rails console

## Homework

* String vs. text?
* Symbols vs. strings
* Is it better to have `owner_id` or `user_id`?
* `find_by` method?

## Quiz

* `new` + `save` vs. `create`?
* Naming best practice?
  * Be descriptive.
* What goes in options hash?

## Demo

* Where can we use stuff from seed file?
* `new` + `save` vs. `create`?
* If things are dependent, and when one is deleted the other should be as well, how can we do that?
* What does `has_many` mean?
* Model validations vs db constraints?
* When to use reload?
* Irb vs pry?
  * `pry_rails`

# 2/8/2017
Lecturer: Shamayel Daoud
Notes by Gage Newman
## Yesterday
+ variables and question marks vs. options hash? # options hash allows you to
pass in variables by name rather than depending on their ordering
  + ?? # the value is what's getting inserted into the query; the key is your
  reference to that
+ how does the `execute` method work? # it's a helper method to DRY up the code
+ how practical is it to write out queries like this? # not - we'll use Active
Record in the future
+ VARCHAR vs. TEXT data types? # VARCHAR has a character limit of 255
characters, TEXT doesn't; use TEXT
+ are these data types standardized across all implementations of SQL? # the
basic ones are; more complex ones might not be
+ are primary keys automatically set as integers? # no - you have to explicitly
set that column's data type as INTEGER
+ should join tables also have a primary key column? # yes, in general, yes
+ are there methods to create join tables? # ... ?
  + is there smart matching so that we don't have to explicitly state the
  primary key and foreign key? # yes, but don't use it until monday

## Homework
+ ?? # show me your code after lecture
+ what rails version will we be using? # 4.2.6; rails 5 is a little different
but it shouldn't affect your work too much
+ every time we grab an object out of the database, it's a new object - how
does the database keep track of them? # we query the database to create that
object, and if we edit it it saves its new information back to the database
+ how does `Cat.first` work? # `Cat` is just a class; the class method
`::first` queries the database and returns the first cat
+ my ids weren't restarting at 1 - why? # the ids always count up - if you want
the ids to restart, drop your tables and rebuild them
+ jeff's atom was behaving weirdly - why? # he customized atom to be weird (vim
mode?)
+ `Class.all` returns an array - how do you empty the array? # if you want
nothing to show up, you need to `destroy` all the rows in that table
+ are there other queryers other than `first` and `last`? # use `::find` with
an id, in general
+ rails knew that "person" converts to "people" - how? # rails knows;
convention over configuration (just follow the rules and rails will do a lot of
work for you)
  + is there an automatic way to generate a migration and the model at the same
  time? # yes, but let's save that for next week

## Quiz
+ what's the best way to get the most out of the quizzes? # if you don't
immediately get it, do some research - googling, re-read the readings; maybe do
the quiz first to get a sense of what the night's learning goals are

**Q1**
+ do we ever not want timestamps? # short answer, no

**Q2**
+ is it bad convention to have the associations named something other than
the class? # you sometimes should do that
+ hashes with `=>` vs `:`? # either is fine

**Q3**
+ are associations a method? # yes they are
+ what if a house has more than one person? # many-to-many relationships
require join tables
  + so does `belongs_to` follow real-world ownership? # no, it just refers to
  the structure of the relationships between two tables
+ can you make multiple associations for the same class? # yes
+ can you make self-associations? # yes, associations are joins, so since
we can have self-joins, we can have self-associations
+ what if we changed the `has_many` to `has_one`? # then you would only get one
result when you called that method

**Q4**
+ ? # `subscribers` returns a collection, and we need to search that collection
for "aaron the human"

**Q5**
+ is rails an ORM? # no, but rails contains an ORM called ActiveRecord
+ you still have to write the methods when you're using an ORM, right? # correct
+ do associations create tables that we can query? # no, associations just
create methods that query from our existing tables

**Q6**
+ if you were to put parentheses into `has_many` or `belongs_to`, where would you put them? # around the name of the new method and the options hash
+ could you ?? # `book_checkouts` is a join table between `books` and `users`

## Intro Rails

**MVC Diagram**
+ is the controller ruby code? # it is part of rails, but we'll get to it later
+ can we use something else other than ruby in rails? # no
+ explain the MVC diagram? # ok: request -> router -> controller -> model -> DB
-> model -> controller -> view -> controller -> response
+ are we going to learn ?? # the controller is the hub of this disgram; we'll
learn it all next week

**Rails demo**
+ if we get an error when we run a rails command, what do we look for? #
depends on the error; you'll get familiar with the different errors. it ranges
from syntax errors (missing commas) to other types of issues, but in general
read the error message
  + i got a dependency between gems error? # probably caused by the versions of
  the gems used in your project
+ when do we rollback and when do we not? # i never rollback; i just keep
rolling forward
+ if we add `null: false` to our migration, is that a validation? # no, it's a
constraint. validations are added at the model level
+ do we have to use `t.` to add column data types? # it's the rails syntax for
it
+ can we set our own primary_key? # convention over configuration
  + does rails allow you to customize your primary key? # rails is the only
  thing that uses the primary key, so, it doesn't really matter
  + can we make other columns unique? # yes
+ ?? # primary keys are always indexed
+ when does the schema file get created? # it gets created once you've run a
migration, and tracks changes to your database made in any subsequent
migrations
+ do indexes always have to be unique? # no
+ if you wanted to run two migrations at the same time, could you? # yes; you
could actually write both sets of changes into the same migration OR write two
separate migrations and they'll get run at the same time
+ are migrations like committing in git? # kind of
+ is there any benefit to having the migration history? # migrations get re-run
if you drop your database and rebuild it
+ ?? # make a new file to make a new change once you've run a migration
  + what if we changed thename of the file? # just don't.
+ is there a way to consolidate your migration files? # don't worry about it.
+ ?? # depends on the company's workflow
+ ?? # we'll get to that later
+ ?? # add an index and then add the unique constraint
+ ?? # syntax of code in migration files
+ can you add multiple columns of the same type (e.g., integer) in one line? #
no
+ ?? # let's try to understand each step before chunking them together into one
omnibus scaffold step
+ ?? # you want your migration names to be as descriptive as possible; you can
nonetheless combine multiple different changes into one migration file
+ would i make a new `cars` table with the things i want in it? # better to
edit a table rather than recreate it entirely
+ what if we use a name we've already used? # the files also have timestamps,
so it shouldn't be a problem
+ `rake db:migrate` updates what files? # the database and `schema.rb`
+ what if we wanted to add a new constraint when our database already had
information in it? # the contraint only applies going forward; this is a common
error
+ jeff's model files, how did he get the schema for that model in each model
file? # the `annotate` gem (crowd goes "oooooo")
+ why are we adding the non-unique indices? # for speedier lookup - in general,
every column we will be looking up rows by (e.g., foreign keys) should get an
index

**After break**
+ ?? # i'm sure there's a way
+ if we already have the constraint, is the validation redundant? # yes, but:
belt & suspenders; validations give us better errors
+ if you wrote options hashes into separate lines, would rails still understand
them? # yes
+ when you create a new object, are there constraints or validations? # no, not
until you try to save it
+ ?? # the errors are what's wrong with this object, right now
  + ?? # i'm writing this error message; the key in the errors hash can be
  whatever i want it to be
  + so what is `errors`? # an object with some information stored essentially in
  a hash
  + what if we set `self.errors = {}` instead of `self.errors <<`? # it would
  do a different thing that you probably don't want
  + ?? # look at what your constraints and validations are
  + ?? # it should be convention that the key for the error is the variable
  because that's very clear
  + so doesn't the error stick around forever? # yes, but we don't care about
  objects persisting because rails creates and destroys objects all the time
  + `@` vs. `self`? # self in this case, `errors` is a method not an instance
  variable
+ can we re-save what we destroy? # yes, `destroy` returns the thing that just
got destroyed
+ multiple custom validations? # either add them to that line or write
`validate :x` multiple times
+ `validates` vs. `validate`? # `validates` is a built-in validation,
`validate` is for our custom validations

**Associations**
+ do we need to use the normal associations for our `through` associations? #
yes
+ is there a `belongs_to through`? # no; either `has_many through` or `has_one
through`
+ when use `has_one`? # if there is a use case for it (e.g., constraints)
+ ?? # `has_many` will give you a collection of objects back
+ ?? # it's nice to have them even if you don't use them
+ is `:User` == `"User"` in association definitions? # yep
+ primary key & foreign key? # primary_key == foreign_key; one table holds one,
one table holds the other
  + how do i keep it straight? # look in the schema; primary_key is always `id`
  + ?? # in `belongs_to`, primary_key refers to other class
  + primary_key referring to the main id? # yes
+ does the order of the options matter? # no (it's a hash)
+ can you email this out? # yes
+ can you visually represent this? # #{draws the demo's tables on board, draws
connections between them and explains those connections as associations}
  + what is the code for these connections? # writes association code on board
  + in a `has_many through` is the `source` always a `belongs_to`? # no, the
  source can be whatever
  + the `through` matches the name of the other association? # yes
  + is leaving a join table always `belongs_to`? # yes
  + for one `has_many` can you have multiple `through` statements? # no,
  maximum one `through` for each `has_many`, though you can have the `through`
  be another `through`
+ ?? # you can't have a `belongs_to_many` association
+ can you chain `.uniq` on to a collection to remove dups? # yes
+ is `has_one` like `has_many` + `.first`? # yes
  + `has_one` returns one object, not in an array? # yes
+ how do you drop tables? # `rake db:drop` drops the databases
+ does dropping a table ?? # because the migrations aren't changed, you can
re-run them and get your DB back in shape
+ does running your seed file erase your DB and write your seed data in or just
add them? # just adds them
+ ?? # hardcode ids in, use bang methods in seed file
+ drop table vs. destroy_all? # destroy_all just erases the data in that table,
not destroying the structure of that table entirely
+ `drop_table` in the `down` method in a migration? # old syntax; we use
`change` instead of `up` and `down`
+ dropping tables vs. dropping the DB? # are different things
+ is today rails or ActiveRecord? # yes lol; rails uses and includes
ActiveRecord
+ what is `rake`? # a task command script thing (ruby make)
+ drop table? # make a new migration
  + drop table vs. drop DB? # #{draws and erases on board}
  + migrate? # #{draws table on board}
  + seed? # #{fills in table on board}
+ migration drop table ?? rollback ?? ? # you can rollback if you want to

---

# W3D3

Lecture: Munyo Frey

## Yesterday Questions
* Why not start with ModelBase in the AA Questions project?
* What's the difference between using a foreign key and a reference?

## Quiz Questions
* Why do we need commas in our relations declarations?
* Does class_name: have to be a string?
* Can the additional hash arguments for relational information be on one line?

## Homework Questions
* How do we do null and default options in migrations?
* Can we change columns when we have data in the database already?

## Demo Questions
* How is an index represented in the database?
* Can we run multiple custom validations in one line.
* How could we create a custom validation to make sure that rentals do not overlap?
* What is rake db:reset?
* What happens when we call errors without full_messages?
* Is there any case where we want the primary key and foreign keys to be different between the two sides of a relation?
* Are has one associations only used for throughs?
* Do we need the join table?
* Can you write many levels of through?
* What if there is a change in the database to an instance we are using in the console?



## 9/28/16

Lecturer: Shamayel Daoud

### Questions

* Q: what is the difference between ? and symbol?
* Q: how does Ruby know where to put heredoc inputs in the doc when using multiple question marks?
* Q: what are development, production routes?
* Q: A question about uniqueness and index
* Q: What type of indexing does add_index add?
* Q: how far back to migrations go? Which migrations are migrated?
* Q: What is happening when we put 'null: false'
* Q: WHy have these restrictions that might make the database throw errors?
* Q: What if there is a not null constraint on the new column you add to a table with existing data
* Q: create! vs create
* Q: in the homework, class names were strings? does it matter ?
* Q: how do we delete the database ?
* Q: What if I want to chain throughs together?
* Q: does the order of key value pairs in associations matter?
* Q: What is ActiveRecord's relationships to rails?

### Mistakes

* Lots of confusion about validations vs constraints and why we use both
* Lots of confusion about what indexing actually does -- people thinking it's another column or referring to the index of a row in the db
* Understanding that they should just make a new migration to perform changes on the db

## 7/27/2016

Lecturer: Claire Rogers

### Questions

  * What does it mean to persist state to the database? (from hw)
  * What is the difference between using :Class_Name and "Class_Name"
  * What is the first argument of an association?  Why is it not a k-v pair?
  * What is the force: :cascade in the schema?
  * Can you change the DB by editing the schema file?
  * What is the difference between `rails` and `rake` at the command line?
  * What is the difference between `create!` and `create`
  * What is the difference between `new` and `create`
  * Why do we have both model- and database-level validations

### Mistakes
  * Thinking the schema file was editable
  * Trying to pass arguments to heredocs, not methods
  * Wanting to edit migration files after running them
  * Generally not understanding how databses work

### Notes

  * When I presented the seeds and schema file of the demo, what I thought would be a two minute demo turned into a 45-minute discussion of how databases work.  Students were very confused about the schema, thinking that it defined the structure of the database.  Maybe this concept isn't clear enough in the videos.  I'd recommend having a slide dedicated to this topic next time.
  * I did a demo that began with a rails skeleton which had all the tables created.  First off I reviewed the schema and we poked through the seed data in the rails console.  Then, we added validations (including custom), then whiteboarded associations, then coded them up.  
  * Q&A ended up running ~2hrs
  * Recommend adding a slide list all the common rake commands and what they do
