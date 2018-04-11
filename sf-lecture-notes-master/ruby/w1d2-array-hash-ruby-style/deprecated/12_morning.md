# W1D1

+ Methods
+ Decomposition
+ Iteration
+ Symbols, Strings, Hashes
+ I/O
+ Style

---

## Methods
+  Know what side effects and return values are.
+  Know what an implicit return is, and that they are preferred.
+  Know some signs of a good method:
   +  does one thing
   +  short description, good name
   +  <10 lines of code

---

### Method decomposition... its a thing

watch https://www.youtube.com/watch?v=D156TfHpE1Q

```rb
salutation = "Good morning"
title = "sir"

full_name = "Tony Stark"
projname = "secret project"
version = "mark 7"
service_inquery = "store on stark industries central database"
designation = "jarvis"
puts "#{ salutation }, #{ title } #{ full_name }. ",
  "#{ designation } at your service.",
  "lets work on #{ projname } version #{ version }.",
  "May I #{ service_inquery }".

$projname
module Suit # version
class CentralDatabaseEnabler #feature collaborator
  def service_inquery
class Jarvis
  SALUTATION
  def greet(title, first, last)
```

---

## Iteration
+  its okay to name index variables like x, i, j
+  index variables conventionally start at zero.
+  Array#each is preferred because in while the iterater variable lives beyond
   block.
+  Be comfortable nesting loops when necessary.
+  Know not to nest too deeply.

---

## Symbols, Strings, and Option Hashes
+  Know when to use Symbol instead of String.
   + Symbols are immutable
+  Know how to write a method that takes an options Hash.

**DEMO**:
```rb
s1 = :s
s2 = :s
s1.object_id
s2.object_id
```

---

## Input/Output
+  difference detween print and puts and p.
   + puts adds newline
```rb
puts ["let it go"] * 2
p ["let it go"] * 2
```
+  prefer using a block when working with files so you dont have to close file
explicitly
+  Know how to access arguments given to your script from the command line

---

## Style
## Coding style
+  Always follow these most important rules:
+  Indent your code.
+  Limit lines to 70 chars.
   + show wrap and wrap chars 80
+  Avoid long methods and nesting more than two levels deep.
+  Don't over-comment.

---

## Classes
+  stop using a Hash and switch to a class when you need to call methds.
+  Talk about difference between class and instance
+  use ::new to create new instances talk about factory methods.
+  the #initialize method is called after ::new.
```rb
class Point
  def self.my_new(*args, &blk)
    instance = allocate
    instance.my_initialize(*args, &blk)
    instance
  end

  def my_initialize(x, y)
    @x, @y = x, y
  end
end

Point.my_new(5, 4)
```

+  Instance should be fully setup by the end of initialize.
+  store data in an object using instance variables.
+  show attr_accessor and manually define getters and setter methods

---

## Pass by reference
+  All ruby objects are pass by reference

---

# Projects

## Students Courses
+  how to add to both the list of students and courses


# Meta notes

Tapas: 125

# Content

https://gist.github.com/2b7c6023c619f73a9a26

