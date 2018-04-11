[Notes from Jonathan](./previous_lectures/jonathan.md)  
[June cohort:  Daniel](./previous_lectures/june2016.rb)  

## Solutions prep

**Expect questions on:**
+ A03-P:
  + has_one vs. has_many: very similar, has_many returns an array of Ruby objects, has_one returns a single Ruby object, like `has_many.first`
    + NOTE: If a model has a foreign_key, it `belongs_to`. NOT `has_one`
  + Julie Andrews-esque problem (Chris Farley?)
    + Might show `SELECT *` of whole table. Every actor has a row with every co-star. We're picking rows where one actor is Chris, and the other actor is the lead.
    + Start with just `JOIN` statements, then add `WHERE` filters one by one.
  + make sure students know `.mode column` and `.headers on` for assessment
+ Solutions
  + When do queries actually run?
    + When you need to evaluate results of query. #each, puts, return, etc.
    + Use `puts query.class` or a random string to show when query is still just a relation and no queries have been fired yet.
  + `includes`
    + ex: `self.answer_choices.includes(:responses)`
    + `answer_choice_ids = self.answer_choices.map(&:id)`
    + `responses = Response.where(answer_choice_id: answer_choice_ids)`

**Point out:**
+ All AR can be written in raw SQL
+ Difference between #count and #length. #count forces a query!
+ `where.not`, any comparison with NULL results in false

## Lecture

**1) Self**
+ Skeleton class with private methods
  + send hacks the private methods (!!!)
  +

**2) Hacking Ruby Classes**
+ instance_variable_set/instance_variable_get
+ send

**3) define_method**
+
