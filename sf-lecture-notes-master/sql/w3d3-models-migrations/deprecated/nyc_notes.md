[April cohort:  Tommy](./previous_lectures/april2016)  
[June cohort:  Gigi](./previous_lectures/june2016)  

## Solutions prep

**Expect questions on:**
+ Average karma -- N + 1 queries

**Point out:**
+ Two syntaxes for interpolating values into heredoc: `?` and `:key`. They don't have w3d2 lecture so important to point this out/explain when the `:key` notation might be useful (if you use the same variable multiple times, if you have lots of interpolation)
+ Heredoc is just a string --- you can extract the whole heredoc into a variable and pass it in as the first argument to the #execute method. The #execute method will look for `:` and `?` in the string so it can interpolate sanitized value.
  + People who did ModelBase class might ask about interpolation. You can NOT interpolate table names into a SQL heredoc. You can only interpolate values
+ QuestionsDatabase file
  +  Rewrote methods as class methods for convenience
  + `results_as_hash`: each row is returns as a hash with column names pointing to values, as opposed to an array of values
  + `type_translation`: makes sure that SQL NULL becomes ruby nil, etc.

## Lecture
**Note**
Important to show SQL queries in rails console throughout the lecture. They should be making connections between what they did yesterday and the AR they're using today!  
Consider what part of the clone(Twitter) you want to prepare ahead of time, based on how much they did in the HW. It might be good to have a couple models created in advance, complete with associations and validations. Then you won't have to repeat too much material when you move on to `has_many :through` associations. If you think they need a repeat, you can just delete the prewritten info :)

**1) Where are we?**
+ Full-stack projects
+ Redux
+ React
+ jQuery
+ CSS
+ JavaScript
+ HTML
+ Views
+ Controllers
+ Models
+ SQL
+ Ruby + OOP


**2) Schema**
+ Go over schema and basic associations
+ Tweet --- User --- Country
+ Tweet belongs_to User, User belongs_to Country. Has_many vice_versa
  + Model with foreign key belongs_to other Model
  + Analogy: A dog wears a collar. A dog belongs_to the owner specified by the collar.
+ Possible question: Why Country table? Why not just a country column on the users table?
  + Possible answer: Imagine if you want to update the country. With country table, you only edit one record.

**3) Migrations**
+ Show rails app -- we're sticking to models and db folder
+ Let class try filling in migrations
+ Only go forward! Not backward. be rake db:rollback can really mess up team members so it's dangerous. For now, don't use it at all.
+ Good practice to add index to all foreign keys. Anything you want to look up a lot.
  + Also add index to anything that should be unique. Like `username`
  + `unique: true` DOES NOT NOT WORK AS AN OPTION IN `create_table`
+ Show migration docs! For add_column, remove_column, rename, anything their hearts desire

**4) Active Record is amazing!**
+ Make models. Run `annotate`. (They need annotate and pry-rails today)
+ Open rails console and show off SQL queries and all of CRUD. Syntax is basically always options hash as argument
  + `#new`
  + `save!`/`save`
    + Good time to add simple validations to show `valid?`
    + `save` will return false if `valid?` is false. `save!` will raise an error
    + Sometimes we'll want true/false for control flow. Other times we want an Rails error. We never want a PG error because that means unnecessary communication with database.
    + Now show seeds which use `create!` (i.e. `new` + `save!`). Run seeds.
  + `all`
  + `find`/`find_by`
  + `first`/`last`
  + `destroy`
  + `update!`/`update`
+ Show query docs!

**5) Associations**
+ Tweet#author, User#tweets
  + emphasize that first argument is just the name of the method. Other arguments are part of an options hash
  + The relationship btwn 2 classes has 1 FK, 1 PK. You use that FK/PK for both the has_many and the belongs_to association.
  + Not allowed to use shortcuts yet!
  + Show queries!
+ Tweet#country
  + `tweet.author.country` => 2 queries
  + `tweet.country` => 1 amazing JOIN query
+ Another benefit of has_many associations: lots of cool additional methods
  + `user.tweets.new`
  + Show association docs!

+ Be careful of introducing future lecture stuff
+ Cold call!
+ Bit more detailed agenda
+ small mistakes -- acknowledge well.
