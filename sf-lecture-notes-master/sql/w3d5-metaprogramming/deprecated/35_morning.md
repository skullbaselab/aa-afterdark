# Content
## Metaprogramming
+ send "send a message to object, asking object to do something"

```ruby
x = [1, 2, 3]
x.first
x.send("first") or x.send(:first) # passing string or symbol totally cool
```

+ define_method (private method)
```ruby
class Dog; end
Dog.send(:define_method, :bark) { puts "Woof" }
```

+ instance_variable_get
+ instance_variable_set
+ class instance variables (punt class variables)
+ self in a class method, in define_method and in an instance method.
+ lots of confusion of when to use #meth or self.meth or self.class.meth
+ extend vs include

# Project
## Active Record Lite
There are some methods in the skeleton that will not make sense until later.As you work through the problem you might find them useful.

### Skeleton
**GOTCHAS**:
  constantize before definition
  instance_variable_get takes @
  instance_variable_set takes @
  know thy `self`

* How to download
* Components
  * MassObject
    * self.attributes should return array of attributes
    * self.parse_all takes array of hashes and returns array of objects
    * initialize takes hash and initializes instance variables

  * SQLObject
    * stores table name of the object
    * stores crud methods for object

  * DBConnection
    * gives access to interact with `cats.db`

  * Searchable
   * adds a where method to find things

  * Associatable
    * assoc_params
    * talk more about this...
