class: teal-text
# Meta-Programming

### Programming
* **Dynamic data** - instance variables
* **Static Behavior** - methods

### Meta-Programming
* **Dynamic Behavior** - Creating and changing methods on the fly

---
class: teal-text
# MetaCorgis

```ruby
class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
    snack_box.methods.grep(/^get_(.*)_info$/) { MetaCorgiSnacks.define_snack $1 }
  end

  # phase 1
  # def method_missing(name, *args)
  #   info = @snack_box.send("get_#{name}_info", @box_id)
  #   tastiness = @snack_box.send("get_#{name}_tastiness", @box_id)
  #   name = "#{name.to_s.split('_').map(&:capitalize).join(' ')}"
  #   result = "#{name}: #{info}: #{tastiness} "
  #   tastiness > 30 ? "* #{result}" : result
  # end

  # phase 2
  def self.define_snack(name)
    define_method(name) do
      info = @snack_box.send("get_#{name}_info", @box_id)
      tastiness = @snack_box.send("get_#{name}_tastiness", @box_id)
      display_name = "#{name.split('_').map(&:capitalize).join(' ')}"
      result = "#{display_name}: #{info}: #{tastiness}"
      tastiness > 30 ? "* #{result}" : result
    end
  end
end
```

---

class: teal-text
## Predict the output!

```ruby
class MyClass
  puts self

  def self.my_class_method1
    puts self
  end

  def MyClass.my_class_method2
    puts self
  end

  def my_instance_method
    puts self
  end

end

def MyClass.my_class_method3
  puts self
end

MyClass.my_class_method
x = MyClass.new
x.my_instance_method
```

---
class: teal-text
## #instance_variable_get(ivar) / #instance_variable_set(ivar, value)

```ruby
class Corgi
  # no attr_accessors!

  def initialize(name)
    @name = name
  end

end

corg = Corgi.new("Sparkles")
#corg.name # Error! undefined method `name'
corg.instance_variable_get("@name")
corg.instance_variable_get(:@name)
corg.instance_variable_set("@color", "rainbow")
corg.instance_variable_get(:@color) # "rainbow"
```

---
class: teal-text
# #send

```ruby
class Corgi

  def initialize(name)
    @name = name
  end

  private

  def eat
    "nom nom"
  end

  def sleep
    "Zzzzzzzz"
  end

  def party(how_hard = 3)
    party_chars = ["!*$!"] * how_hard
    party_chars.join(" ")
  end

end

corg = Corgi.new("Tony")

corg.sleep # private method called!
corg.send(:sleep) # Zzzzzz
```

---
class: teal-text
## Using #send

```ruby
class Corgi

  def random_activities
    puts "============"
    [:eat, :sleep, :party].shuffle.each do |activity|
      puts self.send(activity) # explicit self for clarity
    end
  end

end

corg.random_activities
corg.random_activities
corg.random_activities

# Send with arguments
corg.send(:party, 1) # '!*$!'
```

---
class: teal-text
# Method Missing

```ruby
# polite errors
def method_missing(method_name, *args)
  puts "I'm sorry, I can't find a method called #{method_name}"
end
```

---
class: teal-text
# #define_method
Find self again!


```ruby
class MyClass
  puts self

  # defines an instance method for this class
  # here, self is MyClass
  define_method(:my_meta_method) do
    # inside the block, self is an instance of MyClass
    puts self
  end

end

x = MyClass.new
x.my_meta_method
```
---
class: teal-text
# MethodMaker

```ruby
module MethodMaker

  def make_methods(*method_names)
    method_names.each do |method|
      define_method(method) do |arg = nil|
        string = "#{method}!"
        string += " and #{arg}" if arg
        string
      end
    end
  end

end

class Corgi
  extend MethodMaker
  make_methods :kick_butt, :chew_bubblegum
end

corg = Corgi.new
corg.kick_butt
corg.kick_butt(u.chew_bubblegum)
```

---
class: teal-text
# Include vs Extend

```ruby
module MyModule

  def my_module_method
    "Extremely useful method"
  end

end

class MyIncludingClass
  # turns all the methods from MyModule
  # into instance methods for MyIncludingClass
  include MyModule
end

class MyExtendingClass
  # turns all the methods from MyModule
  # into class methods for MyExtendingClass
  extend MyModule
end

x = MyClass.new

puts MyIncludingClass.new.my_module_method
puts MyExtendingClass.my_module_method
```


```ruby
def method_missing(method_name, *args)
  x = "find_by_"
  if method_name.take(x.length) == x
    find_by(method_name.drop(x.length) => args.first)
  end
end
```



```ruby
module Associatable
  def belongs_to(assoc_name, options = {})
    define_method(assoc_name) {  }
  end
end

# belongs_to(:user) => define instance method user on tweet



class Corgi
  # self is Corgi
  extend MethodMaker
  self.make_methods(:kick_butt, :chew_bubblegum)
  # ^^ same as 'make_methods :kick_butt, :chew_bubblegum'
end




class Corgi

end

Corgi.class_eval do
  # define Corgi instance methods in here, as if we were in the body of the Corgi class
end

Corgi.instance_eval do
  # instance of class 'Class'
end

```
